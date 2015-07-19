defmodule JustBot.Mixfile do
  use Mix.Project

  def project do
    [app: :just_bot,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :slack],
     mod: {JustBot, []}]
  end

  defp deps do
    [{:slack, "~> 0.0.5"},
     {:websocket_client, git: "https://github.com/jeremyong/websocket_client"}]
  end
end
