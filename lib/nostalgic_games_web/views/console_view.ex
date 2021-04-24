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

  def render("show_all", %{consoles: consoles}) do
    %{data: render_many(consoles, ConsoleView, "console.json")}
  end

  def render("console.json", %{console: console}) do
    %{id: console.console_id,
      name: console.console_name
    }
  end
end
