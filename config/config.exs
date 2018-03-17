use Mix.Config

# Note that the PORT is a string when read from the environment.  The String
# is converted to an integer in the application module.

port = System.get_env("PORT") || "8000"
config :elixir_webserver_base, http_port: String.to_integer(port)
