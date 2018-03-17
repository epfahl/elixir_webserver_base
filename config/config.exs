use Mix.Config

# Note that the PORT is a string when read from the environment.  The String
# is converted to an integer in the application module.

config :elixir_webserver_base, http_port: System.get_env("PORT") || "8000"
