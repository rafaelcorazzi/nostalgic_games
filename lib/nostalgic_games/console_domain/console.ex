defmodule NostalgicGames.Console do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:console_id, Ecto.UUID, autogenerate: false}
  schema "console" do
    field :console_plataform_name, :string
    field :console_plataform_code, :string

  end

  @required_params [:console_id, :console_plataform_name, :console_plataform_code]
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
