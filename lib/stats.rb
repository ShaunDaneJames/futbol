require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'game_team'

class Stats
  attr_reader :games,
              :teams,
              :game_teams

  def initialize(data)
    @games      = CSV.read(data[:games], headers: true, header_converters: :symbol).map {|row| Game.new(row)}
    @teams      = CSV.read(data[:teams], headers: true, header_converters: :symbol).map {|row| Team.new(row)}
    @game_teams = CSV.read(data[:game_teams], headers: true, header_converters: :symbol).map {|row| GameTeam.new(row)}
  end

  def get_goals(season_id)
    goals = get_team_id(season_id).transform_values do |game_team|
      game_team.sum {|game| game.goals.to_f} / game_team.sum {|game| game.shots}
    end
  end

  def get_tackels(season_id)
    tackles = get_team_id(season_id).transform_values do |game_team|
      game_team.sum {|game| game.tackles}
    end
  end

  def get_team_id(season_id)
    season_games = gather_season_games(season_id)
    season_games.group_by {|team| team.team_id}
  end

end
