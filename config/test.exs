use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :circleci_orb, CircleciOrbWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :argon2_elixir, t_cost: 2, m_cost: 8
config :bcrypt_elixir, log_rounds: 4
config :pbkdf2_elixir, rounds: 1

# Configure your database
config :circleci_orb, CircleciOrb.Repo,
  username: "postgres",
  password: "postgres",
  database: "circleci_orb_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

import_config "#{Mix.env()}.*.exs"
