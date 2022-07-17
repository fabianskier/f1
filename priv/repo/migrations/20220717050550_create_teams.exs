defmodule F1.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :base, :string
      add :team_chief, :string
      add :technical_chief, :string
      add :chassis, :string
      add :power_unit, :string
      add :entry, :string
      add :world_championship, :integer
      add :highest_race_finish, :string
      add :pole_position, :integer
      add :fastest_lap, :integer
      add :car_image_url, :string
      add :team_image_url, :string

      timestamps()
    end
  end
end
