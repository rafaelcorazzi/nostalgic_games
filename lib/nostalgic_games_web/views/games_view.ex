defmodule NostalgicGamesWeb.GamesView do
  use NostalgicGamesWeb, :view
  alias NostalgicGames.Games
  alias NostalgicGamesWeb.GamesView

  def render("show.json", %{games: %Games{
    console_id: console_id,
    reference_id: reference_id,
    title: title,
    game_id: game_id,
    cover_image: cover_image,
    release_date: release_date,
    release_year: release_year,
    publisher: publisher,
    owner: owner,
    genre: genre
  }}) do
    %{
     message: "games details",
     game: %{
       console_id: console_id,
       reference_id: reference_id,
       title: title,
       game_id: game_id,
       cover_image: cover_image,
       release_date: release_date,
       release_year: release_year,
       publisher: publisher,
       owner: owner,
       genre: genre
      }
    }
  end

  def render("index.json", %{games: games}) do
    render_many(games, GamesView, "game.json")
  end

  def render("game.json", %{games: games}) do
    %{console_id: games.console_id,
    reference_id: games.reference_id,
    title: games.title,
    release_date: games.release_date,
    game_id: games.game_id,
    release_year: games.release_year
    }
  end

end
