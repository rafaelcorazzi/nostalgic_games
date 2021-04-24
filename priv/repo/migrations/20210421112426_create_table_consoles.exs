defmodule NostalgicGames.Repo.Migrations.CreateTableConsoles do
  use Ecto.Migration

  def change do
    create table(:console, primary_key: false) do
      add :console_id, :uuid, primary_key: true
      add :console_plataform_name, :string
      add :console_plataform_code, :string
      timestamps()
    end
  end
end
