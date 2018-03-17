defmodule ElixirWebserverBase.Application do
  use Application

  def start(_type, _args) do
    port =
      Application.get_env(:elixir_webserver_base, :http_port)
      |> String.to_integer()

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, ElixirWebserverBase.Router, [], port: port)
    ]

    opts = [strategy: :one_for_one, name: ElixirWebserverBase.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
