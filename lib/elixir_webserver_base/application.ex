defmodule ElixirWebserverBase.Application do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:elixir_webserver_base, :http_port)

    children = [
      # Plug.Adapters.Cowboy.child_spec(:http, ElixirWebserverBase.Router, [], port: port)

      {
        Plug.Adapters.Cowboy2,
        scheme: :http, plug: ElixirWebserverBase.Router, options: [port: port]
      }
    ]

    opts = [strategy: :one_for_one, name: ElixirWebserverBase.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
