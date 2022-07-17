defmodule F1Web.TeamView do
  use F1Web, :view
  alias F1Web.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{
      id: team.id,
      name: team.name,
      base: team.base,
      team_chief: team.team_chief,
      technical_chief: team.technical_chief,
      chassis: team.chassis,
      power_unit: team.power_unit,
      entry: team.entry,
      world_championship: team.world_championship,
      highest_race_finish: team.highest_race_finish,
      pole_position: team.pole_position,
      fastest_lap: team.fastest_lap
    }
  end
end
