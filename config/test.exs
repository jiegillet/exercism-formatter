import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :exercism_formatter, ExercismFormatterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wo6MwhuBvKtoop32lTKKk+RJ0B0l4tV+53ijc2eqKkcX3+stYjqyh+Q2sCda3JKH",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
