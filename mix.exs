defmodule SimpleEcho.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_echo,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SimpleEcho.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.4"},
      # {:zenohex, "~> 0.2.0"},
      {:zenohex,
       git: "https://github.com/biyooon-ex/zenohex",
       branch: "bump_to_zenoh_v0.11.0",
       override: true},
      {:rustler, ">= 0.0.0", optional: true}
    ]
  end
end
