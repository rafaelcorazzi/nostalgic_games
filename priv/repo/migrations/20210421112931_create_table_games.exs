defmodule NostalgicGames.Repo.Migrations.CreateTableGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :game_id, :uuid, primary_key: true

      add :console_id,
          references(:console, column: :console_id, type: :uuid, on_delete: :delete_all)

      add :reference_id, :string
      add :cover_image, :string
      add :title, :string, size: 255
      add :release_date, :naive_datetime
      add :release_year, :integer
      add :genre, :string, size: 120
      add :publisher, :string, size: 120
      add :owner, :string, size: 120

      timestamps(type: :timestamptz)
    end

    create index(:console, [:console_id])
  end
end
