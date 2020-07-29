class SeasonStats < Stats

  def gather_season_games(season_id)
    games_within_season = @games.select {|game| game.season == season_id}
    game_ids = games_within_season.collect {|game| game.game_id}
    @game_teams.select {|game| game_ids.include?(game.game_id)}
  end

  def group_season_wins_by_coach(season_id)
    games_grouped_by_coach = gather_season_games(season_id).group_by {|game| game.head_coach}
    games_grouped_by_coach.each do |coach, games_array|
      games_grouped_by_coach[coach] = games_array.find_all {|game| game.result == "WIN"}.count
    end
  end

  def winningest_coach(season_id)
    wins_by_coach = group_season_wins_by_coach(season_id)
    wins_by_coach.max_by {|_, wins| wins}.first
  end

  def worst_coach(season_id)
    wins_by_coach = group_season_wins_by_coach(season_id)
    wins_by_coach.min_by {|_, wins| wins}.first
  end

  def most_accurate_team(season_id)
    goals = get_goals(season_id)
    @teams.find {|team| team.team_id == goals.max_by {|_, ratio| ratio}.first}.team_name
  end

  def least_accurate_team(season_id)
    goals = get_goals(season_id)
    @teams.find {|team| team.team_id == goals.min_by {|_, ratio| ratio}.first}.team_name
  end

  def most_tackles(season_id)
    tackles = get_tackels(season_id)
    @teams.find {|team| team.team_id == get_tackels(season_id).max_by {|_, ratio| ratio}.first}.team_name
  end

  def fewest_tackles(season_id)
    tackles = get_tackels(season_id)
    @teams.find {|team| team.team_id == get_tackels(season_id).min_by {|_, ratio| ratio}.first}.team_name
  end
end
