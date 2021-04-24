defmodule NostalgicGames.Games.ReadDetails do
  alias NostalgicGames.{Games, Repo}
  alias Ecto.UUID


  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format."}
      {:ok, uuid} -> read_details(uuid)
    end
  end

  defp read_details(uuid) do
    case Repo.get(Games, uuid) do
      nil -> {:error, "game not found."}
      games -> {:ok, games}
    end
  end
end
