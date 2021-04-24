defmodule NostalgicGamesWeb.HealthCheckController do
  use NostalgicGamesWeb, :controller

  def index(conn, _params) do
    json(conn, "server is running...")
  end
end
