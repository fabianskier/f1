defmodule F1.PadockTest do
  use F1.DataCase

  alias F1.Padock

  describe "teams" do
    alias F1.Padock.Team

    import F1.PadockFixtures

    @invalid_attrs %{base: nil, chassis: nil, entry: nil, fastest_lap: nil, highest_race_finish: nil, name: nil, pole_position: nil, power_unit: nil, team_chief: nil, technical_chief: nil, world_championship: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Padock.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Padock.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{base: "some base", chassis: "some chassis", entry: "some entry", fastest_lap: 42, highest_race_finish: "some highest_race_finish", name: "some name", pole_position: 42, power_unit: "some power_unit", team_chief: "some team_chief", technical_chief: "some technical_chief", world_championship: 42}

      assert {:ok, %Team{} = team} = Padock.create_team(valid_attrs)
      assert team.base == "some base"
      assert team.chassis == "some chassis"
      assert team.entry == "some entry"
      assert team.fastest_lap == 42
      assert team.highest_race_finish == "some highest_race_finish"
      assert team.name == "some name"
      assert team.pole_position == 42
      assert team.power_unit == "some power_unit"
      assert team.team_chief == "some team_chief"
      assert team.technical_chief == "some technical_chief"
      assert team.world_championship == 42
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Padock.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{base: "some updated base", chassis: "some updated chassis", entry: "some updated entry", fastest_lap: 43, highest_race_finish: "some updated highest_race_finish", name: "some updated name", pole_position: 43, power_unit: "some updated power_unit", team_chief: "some updated team_chief", technical_chief: "some updated technical_chief", world_championship: 43}

      assert {:ok, %Team{} = team} = Padock.update_team(team, update_attrs)
      assert team.base == "some updated base"
      assert team.chassis == "some updated chassis"
      assert team.entry == "some updated entry"
      assert team.fastest_lap == 43
      assert team.highest_race_finish == "some updated highest_race_finish"
      assert team.name == "some updated name"
      assert team.pole_position == 43
      assert team.power_unit == "some updated power_unit"
      assert team.team_chief == "some updated team_chief"
      assert team.technical_chief == "some updated technical_chief"
      assert team.world_championship == 43
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Padock.update_team(team, @invalid_attrs)
      assert team == Padock.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Padock.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Padock.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Padock.change_team(team)
    end
  end
end
