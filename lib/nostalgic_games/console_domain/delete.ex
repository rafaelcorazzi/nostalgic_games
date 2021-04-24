defmodule NostalgicGames.Console.Delete do
  alias NostalgicGames.{Console, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid Id Format"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_console(uuid) do
      nil -> {:error, "Console not found!"}
      console -> Repo.delete(console)
    end
  end

  defp fetch_console(uuid), do: Repo.get(Console, uuid)
end
