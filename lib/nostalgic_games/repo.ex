defmodule NostalgicGames.Repo do
  use Ecto.Repo,
    otp_app: :nostalgic_games,
    adapter: Ecto.Adapters.Postgres
end
