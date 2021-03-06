require './test/test_helper'
require './lib/team'
require 'pry'

class TeamTest < MiniTest::Test

  def setup
    team_param = {team_id: "1",
                  franchiseid: "23",
                  teamname: "Atlanta United",
                  abbreviation: "ATL",
                  link: "/api/v1/teams/1"}

    @team = Team.new(team_param)
  end

  def test_team_exists
    assert_instance_of Team, @team
  end

  def test_team_has_attributes
    assert_equal "1", @team.team_id
    assert_equal "23", @team.franchise_id
    assert_equal "Atlanta United", @team.team_name
    assert_equal "ATL", @team.abbreviation
    assert_equal "/api/v1/teams/1", @team.link
  end
end
