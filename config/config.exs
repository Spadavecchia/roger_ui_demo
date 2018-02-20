# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :roger_ui_demo,
  ecto_repos: [RogerUiDemo.Repo]

# Configures the endpoint
config :roger_ui_demo, RogerUiDemo.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2NBqS3M82r8Wa3PfxtpWT+ZIxjMjCoCA1E/MTzIVFvUW8Q1ZMW3knjtcXx/4JTCg",
  render_errors: [view: RogerUiDemo.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RogerUiDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure AMQP
config :roger, Roger.AMQPClient,
  host: "localhost",
  port: 5672

config :roger, Roger.Partition.Worker,
  callbacks: RogerUiDemo.Worker.Callback

if node() == :"server@127.0.0.1" do
  config :roger_ui, :server, true
  config :roger, :partitions,
    roger_ui_demo_partition: [default: 10, other: 2]
else
  config :roger_ui, :server, false
  Node.ping(:"server@127.0.0.1")
end

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
