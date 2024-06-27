defmodule SimpleEcho.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: SimpleEcho.Worker.start_link(arg)
      # {SimpleEcho.Worker, arg}
      {Plug.Cowboy, plug: SimpleEcho.MyPlug, scheme: :http, port: 4444},
      {SimpleEcho.ZenohexPingPong, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleEcho.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
