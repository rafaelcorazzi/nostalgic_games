defmodule NostalgicGames do
  alias NostalgicGames.Console

  defdelegate create_console(params), to: Console.Create, as: :call
  defdelegate delete_console(params), to: Console.Delete, as: :call
  defdelegate read_console(params), to: Console.Read, as: :call

end
