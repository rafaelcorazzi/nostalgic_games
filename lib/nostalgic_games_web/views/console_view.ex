defmodule NostalgicGamesWeb.ConsoleView do
  use NostalgicGamesWeb, :view
  alias NostalgicGames.Console
  alias NostalgicGamesWeb.ConsoleView
  def render("create.json", %{console: %Console{console_id: console_id}}) do
    %{
      message: "Inserted",
      console: %{
        console_id: console_id
      }
    }
  end

  def render("show.json", %{console: %Console{
    console_id: console_id,
    console_plataform_code: console_plataform_code,
   console_plataform_name: console_plataform_name
  }}) do
    %{
     message: "Showing plataforms.",
     console: %{
       console_id: console_id,
       console_plataform_name: console_plataform_name,
       console_plataform_code: console_plataform_code
      }
    }
  end

  def render("index.json", %{consoles: consoles}) do
    render_many(consoles, ConsoleView, "console.json")
  end

  def render("console.json", %{console: console}) do
    %{console_id: console.console_id,
      console_plataform_name: console.console_plataform_name,
      console_plataform_code: console.console_plataform_code
    }
  end
end
