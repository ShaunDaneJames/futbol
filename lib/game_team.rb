class GameTeam

  attr_reader :game_id,
              :team_id,
              :hoa,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles

  def initialize(game_team_param)
    @game_id    = game_team_param[:game_id]
    @team_id    = game_team_param[:team_id]
    @hoa        = game_team_param[:hoa]
    @result     = game_team_param[:result]
    @head_coach = game_team_param[:head_coach]
    @goals      = game_team_param[:goals].to_i
    @shots      = game_team_param[:shots].to_i
    @tackles    = game_team_param[:tackles].to_i
  end
end
