defmodule NostalgicGames.Games.Read do
  alias NostalgicGames.{Games, Repo}
  alias Ecto.UUID
  import Ecto.Query
  def call(console_id) do
    case UUID.cast(console_id) do
      :error -> {:error, "Invalid ID format."}
      {:ok, console_id} -> read(console_id)
    end
  end

  defp read(uuid) do
    with_uuid(uuid)
    |> Repo.all
  end
  defp with_uuid(query \\ Games, uuid) do
    query
    |> where([c], c.console_id == ^uuid)
  end
end
