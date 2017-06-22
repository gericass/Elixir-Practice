# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :helloworld,
  ecto_repos: [Helloworld.Repo]

# Configures the endpoint
config :helloworld, Helloworld.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WSkZ3VQ2N/zlTGddtGha1F49Cig1NfuzRzJ1xG1WsD54CzxDVHz/ECZnQxaVOEGa",
  render_errors: [view: Helloworld.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Helloworld.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
