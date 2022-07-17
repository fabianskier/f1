defmodule F1.PadockFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `F1.Padock` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        base: "some base",
        chassis: "some chassis",
        entry: "some entry",
        fastest_lap: 42,
        highest_race_finish: "some highest_race_finish",
        name: "some name",
        pole_position: 42,
        power_unit: "some power_unit",
        team_chief: "some team_chief",
        technical_chief: "some technical_chief",
        world_championship: 42
      })
      |> F1.Padock.create_team()

    team
  end
end
