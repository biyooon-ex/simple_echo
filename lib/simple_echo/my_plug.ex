defmodule SimpleEcho.MyPlug do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, "Hello, SimpleEcho!")
  end

  post "/echo" do
    conn
    |> Plug.Conn.read_body()
    |> handle_request(conn)
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end

  defp handle_request({:ok, body, _conn}, conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, body)
  end

  defp handle_request({:error, _}, conn) do
    send_resp(conn, 500, "Internal Server Error ")
  end
end
