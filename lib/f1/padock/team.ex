defmodule F1.Padock.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :base, :string
    field :chassis, :string
    field :entry, :string
    field :fastest_lap, :integer
    field :highest_race_finish, :string
    field :name, :string
    field :pole_position, :integer
    field :power_unit, :string
    field :team_chief, :string
    field :technical_chief, :string
    field :world_championship, :integer
    field :car_image_url, :string
    field :team_image_url, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :base, :team_chief, :technical_chief, :chassis, :power_unit, :entry, :world_championship, :highest_race_finish, :pole_position, :fastest_lap, :car_image_url, :team_image_url])
    |> validate_required([:name, :base, :team_chief, :technical_chief, :chassis, :power_unit, :entry, :world_championship, :highest_race_finish, :pole_position, :fastest_lap, :car_image_url, :team_image_url])
  end
end
