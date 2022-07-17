defmodule F1Web.TeamControllerTest do
  use F1Web.ConnCase

  import F1.PadockFixtures

  alias F1.Padock.Team

  @create_attrs %{
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
  }
  @update_attrs %{
    base: "some updated base",
    chassis: "some updated chassis",
    entry: "some updated entry",
    fastest_lap: 43,
    highest_race_finish: "some updated highest_race_finish",
    name: "some updated name",
    pole_position: 43,
    power_unit: "some updated power_unit",
    team_chief: "some updated team_chief",
    technical_chief: "some updated technical_chief",
    world_championship: 43
  }
  @invalid_attrs %{base: nil, chassis: nil, entry: nil, fastest_lap: nil, highest_race_finish: nil, name: nil, pole_position: nil, power_unit: nil, team_chief: nil, technical_chief: nil, world_championship: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all teams", %{conn: conn} do
      conn = get(conn, Routes.team_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create team" do
    test "renders team when data is valid", %{conn: conn} do
      conn = post(conn, Routes.team_path(conn, :create), team: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.team_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "base" => "some base",
               "chassis" => "some chassis",
               "entry" => "some entry",
               "fastest_lap" => 42,
               "highest_race_finish" => "some highest_race_finish",
               "name" => "some name",
               "pole_position" => 42,
               "power_unit" => "some power_unit",
               "team_chief" => "some team_chief",
               "technical_chief" => "some technical_chief",
               "world_championship" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.team_path(conn, :create), team: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update team" do
    setup [:create_team]

    test "renders team when data is valid", %{conn: conn, team: %Team{id: id} = team} do
      conn = put(conn, Routes.team_path(conn, :update, team), team: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.team_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "base" => "some updated base",
               "chassis" => "some updated chassis",
               "entry" => "some updated entry",
               "fastest_lap" => 43,
               "highest_race_finish" => "some updated highest_race_finish",
               "name" => "some updated name",
               "pole_position" => 43,
               "power_unit" => "some updated power_unit",
               "team_chief" => "some updated team_chief",
               "technical_chief" => "some updated technical_chief",
               "world_championship" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, team: team} do
      conn = put(conn, Routes.team_path(conn, :update, team), team: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete team" do
    setup [:create_team]

    test "deletes chosen team", %{conn: conn, team: team} do
      conn = delete(conn, Routes.team_path(conn, :delete, team))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.team_path(conn, :show, team))
      end
    end
  end

  defp create_team(_) do
    team = team_fixture()
    %{team: team}
  end
end
