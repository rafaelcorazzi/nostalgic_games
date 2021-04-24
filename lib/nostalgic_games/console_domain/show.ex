defmodule NostalgicGames.Console.Get do
  alias NostalgicGames.{Console, Repo}
  alias Ecto.UUID

  def call() do
      {:ok, console} = fetch_all()
  end

  defp fetch_all() do
    case fetch_all_data() do
      nil -> {:error, "no records!"}
      console -> {:ok, console}
    end
  end
  defp fetch_all_data(), do: Repo.all(Console)
end
