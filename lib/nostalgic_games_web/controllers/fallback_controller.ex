defmodule NostalgicGamesWeb.FallbackController do
  use NostalgicGamesWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(NostalgicGamesWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
