# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

database_url = "postgres://uvfyeqiohkshnd:bcc28f2c17c53fe669c3d0a3defd4f1c7c94fd31e54a7d4d58ae1dc09ccf5c6a@ec2-107-22-245-82.compute-1.amazonaws.com:5432/da1fcplqr566da"

config :nostalgic_games, NostalgicGames.Repo,
  ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")


config :nostalgic_games, NostalgicGamesWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ]

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :nostalgic_games, NostalgicGamesWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
