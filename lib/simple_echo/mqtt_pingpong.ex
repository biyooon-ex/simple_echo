defmodule SimpleEcho.MqttPingPong do
  use GenServer

  @ping_topic "demo/mcam/ping/"
  @pong_topic "demo/mcam/pong/"

  @client_id Mecho

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    # Set topic names
    default_server_type = System.get_env("SERVER_TYPE", "cloud")
    ping_topic = @ping_topic <> default_server_type
    pong_topic = @pong_topic <> default_server_type

    {:ok, pid} =
      Tortoise311.Connection.start_link(
        client_id: @client_id,
        server: {Tortoise311.Transport.Tcp, host: "localhost", port: 1883},
        handler:
          {SimpleEcho.MqttPingPong.Handler,
           [ping_topic: ping_topic, pong_topic: pong_topic, client_id: @client_id]},
        subscriptions: [
          {ping_topic, 0}
        ]
      )

    state = %{pid: pid}
    {:ok, state}
  end
end
