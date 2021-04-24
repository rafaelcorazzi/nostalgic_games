defmodule NostalgicGames.Games.Create do
  alias NostalgicGames.{Repo, Games}

  def call(params \\ :empty) do
    params
    |> Games.build()
    |> create_game()
  end

  defp create_game({:ok, struct}), do: Repo.insert(struct)
  defp create_game({:error, _} = error), do: error
end
