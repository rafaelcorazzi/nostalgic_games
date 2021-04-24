defmodule NostalgicGamesWeb.ConsoleController do
  use NostalgicGamesWeb, :controller
  action_fallback NostalgicGamesWeb.FallbackController

  def create(conn, params \\ :empty) do
    params
    |> NostalgicGames.create_console()
    |> handle_response(conn)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> NostalgicGames.delete_console()
    |> handle_delete(conn)
  end

  def get_all(conn, _) do
      conn
      |> NostalgicGames.fetch_all_consoles()
      |> handle_get(conn)
  end


  defp handle_get({:ok, console}, conn) do
    conn
    |> put_status(:ok)
    |> render("show_all.json", console: console)
  end


  defp handle_response({:ok, console}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", console: console)
  end

  defp handle_delete({:ok, console}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error
  defp handle_response({:error, _changeset} = error, _conn), do: error
end
