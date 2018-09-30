defmodule ElixirWebserverBase.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_webserver_base,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirWebserverBase.Application, []}
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.6"},
      {:cowboy, "~> 2.4"}
    ]
  end
end
