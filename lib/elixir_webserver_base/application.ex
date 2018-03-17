defmodule ElixirWebserverBase.Application do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, ElixirWebserverBase.Router, [], port: get_port())
    ]

    opts = [strategy: :one_for_one, name: ElixirWebserverBase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp get_port() do
    Application.get_env(:elixir_webserver_base, :http_port)
    |> String.to_integer()
  end
end
