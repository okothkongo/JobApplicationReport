# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :job_application_report,
  ecto_repos: [JobApplicationReport.Repo]

# Configures the endpoint
config :job_application_report, JobApplicationReportWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9dXnbwzzgYZAw6b/bg2UT/GfXeScAHtpEOLJ9GrOHIPE/Pf/5g5r2zto8VzUInHm",
  render_errors: [view: JobApplicationReportWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: JobApplicationReport.PubSub,
  live_view: [signing_salt: "sZ76Xox/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
