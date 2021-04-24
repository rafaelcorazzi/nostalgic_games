defmodule NostalgicGamesWeb.GamesController do
  use NostalgicGamesWeb, :controller
  action_fallback NostalgicGamesWeb.FallbackController

  def show(conn, %{"id" => id}) do
    games  = NostalgicGames.read_games_by_console(id)
    render(conn, "index.json", games: games)
  end

  def game_details(conn, %{"id" => id}) do
    id
    |> NostalgicGames.read_games_detail
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, games}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, games: games)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error


end
