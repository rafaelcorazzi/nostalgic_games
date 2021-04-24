defmodule NostalgicGames.Games do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:game_id, Ecto.UUID, autogenerate: false}
  @foreign_key_type Ecto.UUID

  schema "games" do
    field :reference_id, :string
    field :cover_image, :string
    field :title, :string
    field :release_date, :naive_datetime
    field :release_year, :integer
    field :genre, :string
    field :publisher, :string
    field :owner, :string
    timestamps()

    belongs_to(:console, NostalgicGames.Console,
      foreign_key: :console_id,
      references: :console_id,
      primary_key: false
    )
  end

  @required_params [:console_id, :game_id]

  def build(params \\ :empty) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params \\ :empty) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
