defmodule NostalgicGames do
  alias NostalgicGames.{Console, Games}

  defdelegate create_console(params), to: Console.Create, as: :call
  defdelegate delete_console(params), to: Console.Delete, as: :call
  defdelegate read_console(params), to: Console.Read, as: :call
  defdelegate read_games_by_console(params), to: Games.Read, as: :call
  defdelegate read_games_detail(params), to: Games.ReadDetails, as: :call
  defdelegate read_all_console(params \\ %{}), to: Console.ReadAll, as: :call
end
