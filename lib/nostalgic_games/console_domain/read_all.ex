defmodule NostalgicGames.Console.ReadAll do
  alias NostalgicGames.{Console, Repo}

  def call(params \\ %{}) do
     Repo.all(Console)
  end


end
