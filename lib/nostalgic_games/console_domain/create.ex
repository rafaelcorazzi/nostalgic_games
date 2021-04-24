defmodule NostalgicGames.Console.Create do
  alias NostalgicGames.{Repo, Console}

  def call(params \\ :empty) do
    params
    |> Console.build()
    |> create_console()
  end

  defp create_console({:ok, struct}), do: Repo.insert(struct)
  defp create_console({:error, _} = error), do: error
end
