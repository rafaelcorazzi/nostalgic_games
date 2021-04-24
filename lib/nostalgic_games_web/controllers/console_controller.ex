defmodule NostalgicGamesWeb.ConsoleController do
  use NostalgicGamesWeb, :controller
  alias NostalgicGames.{Repo, Console}

  action_fallback NostalgicGamesWeb.FallbackController

  def create(conn, params \\ :empty) do
    params
    |> NostalgicGames.create_console()
    |> handle_response(conn, "create.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> NostalgicGames.delete_console()
    |> handle_delete(conn)
  end



  defp handle_delete({:ok, _}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  def index(conn, _params) do
    consoles = Repo.all(Console)
    IO.inspect(consoles)
   # IO.puts(consoles)
   render(conn, "index.json", consoles: consoles)
  end

  def show(conn, %{"id" => id}) do
    id
    |> NostalgicGames.read_console()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, console}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, console: console)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error


end
