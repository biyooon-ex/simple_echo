import Config

# Compile Zenohex NIF module locally
# TODO: delete after next version of Zenohex has been released
config :rustler_precompiled, :force_build, zenohex: true

# Configures Elixir's Logger
config :logger, :console,
  level: :debug,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
