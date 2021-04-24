defmodule NostalgicGames.Console.Read do
  alias NostalgicGames.{Console, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format."}
      {:ok, uuid} -> read(uuid)
    end
  end

  defp read(uuid) do
    case Repo.get(Console, uuid) do
      nil -> {:error, "Trainer not found."}
      console -> {:ok, console}
    end
  end

end
