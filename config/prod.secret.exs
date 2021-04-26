# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

database_url = "postgres://iyuqnepkjlbnwg:8a53d27b994b502686838c5a15925e00d36bedf63a82c46d48e89137822fcfe3@ec2-54-224-120-186.compute-1.amazonaws.com:5432/d5dhklu17gstgm"

config :nostalgic_games, NostalgicGames.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")


config :nostalgic_games, NostalgicGamesWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :nostalgic_games, NostalgicGamesWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
