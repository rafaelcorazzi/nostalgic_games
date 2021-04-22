defmodule NostalgicGamesWeb.ConsoleController do
  use NostalgicGamesWeb, :controller
  action_fallback NostalgicGamesWeb.FallbackController

  def create(conn, params \\ :empty) do
     params
     |> NostalgicGames.create_console()
     |> handle_response(conn)
  end

  defp handle_response({:ok, console}, conn) do
      conn
      |> put_status(:ok)
      |> render("create.json", console: console)
  end
  defp handle_response({:error, _changeset} = error, _conn), do: error
end
