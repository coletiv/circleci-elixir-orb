# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :circleci_orb,
  ecto_repos: [CircleciOrb.Repo]

# Configures the endpoint
config :circleci_orb, CircleciOrbWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MpJDb43hT2O7bLWX5SoIz6Wm+o5D83zelpfdNYyc2KrkqW9oZXgxzZEh9wKpULmb",
  render_errors: [view: CircleciOrbWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CircleciOrb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
