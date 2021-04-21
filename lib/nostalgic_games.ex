defmodule NostalgicGames do
  alias NostalgicGames.Console

  defdelegate create_console(params), to: Console.Create, as: :call
end
