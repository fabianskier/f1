defmodule F1Web.TeamController do
  use F1Web, :controller

  alias F1.Padock
  alias F1.Padock.Team

  action_fallback F1Web.FallbackController

  def index(conn, _params) do
    teams = Padock.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, %{"team" => team_params}) do
    with {:ok, %Team{} = team} <- Padock.create_team(team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.team_path(conn, :show, team))
      |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = Padock.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Padock.get_team!(id)

    with {:ok, %Team{} = team} <- Padock.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Padock.get_team!(id)

    with {:ok, %Team{}} <- Padock.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end
