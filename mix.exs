defmodule SimpleEcho.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_echo,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
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
      {:zenohex, "~> 0.3.0"}
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"]
    ]
  end
end
