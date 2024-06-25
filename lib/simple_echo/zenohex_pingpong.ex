defmodule SimpleEcho.ZenohexPingPong do
  use GenServer
  require Logger

  @ping_key "demo/zcam/ping"
  @pong_key "demo/zcam/pong"

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    # Open Zenoh session and declare subscriber
    {:ok, session} = Zenohex.open()
    {:ok, subscriber} = Zenohex.Session.declare_subscriber(session, @ping_key)

    # Declare publisher with created Zenoh session
    {:ok, publisher} = Zenohex.Session.declare_publisher(session, @pong_key)

    state = %{subscriber: subscriber, publisher: publisher}
    recv_timeout(state)

    {:ok, state}
  end

  def handle_info(:loop, state) do
    recv_timeout(state)
    {:noreply, state}
  end

  defp recv_timeout(state) do
    case Zenohex.Subscriber.recv_timeout(state.subscriber) do
      {:ok, sample} ->
        Zenohex.Publisher.put(state.publisher, sample.value)
        Logger.debug(inspect(sample.value))
        send(self(), :loop)

      {:error, :timeout} ->
        send(self(), :loop)

      {:error, error} ->
        Logger.error(inspect(error))
    end
  end
end
