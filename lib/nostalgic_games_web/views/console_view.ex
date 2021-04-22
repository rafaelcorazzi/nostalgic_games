defmodule NostalgicGamesWeb.ConsoleView do
  use NostalgicGamesWeb, :view
  alias NostalgicGames.Console
  def render("create.json", %{console: %Console{console_id: console_id}}) do
      %{
        message: "Inserted",
        console: %{
          console_id: console_id
        }
      }
  end
end
