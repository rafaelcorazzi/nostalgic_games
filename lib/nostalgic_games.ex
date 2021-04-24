defmodule NostalgicGames do
  alias NostalgicGames.Console

  defdelegate create_console(params), to: Console.Create, as: :call
  defdelegate delete_console(params), to: Console.Delete, as: :call
  defdelegate fetch_all_consoles(), to: Console.Get, as: :call
end
