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
    |> generate_uuid
    |> validate_required(@required_params)
  end

  defp generate_uuid(
         %Ecto.Changeset{valid?: true, changes: %{console_plataform_code: console_plataform_code}} =
           changeset
       ) do
    put_change(
      changeset,
      :console_id,
      UUID.uuid5("6ba7b811-9dad-11d1-80b4-00c04fd430c8", console_plataform_code)
    )
  end

  defp generate_uuid(changeset), do: changeset
end
