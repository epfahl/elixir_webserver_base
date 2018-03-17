defmodule ElixirWebserverBase.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp_with_message(conn, 200, "Well, this is boring.")
  end

  get "/hello/:name" do
    send_resp_with_message(conn, 200, "Hey, you!  I mean, um, #{name}.")
  end

  match "/hello" do
    send_resp_with_message(conn, 200, "Try giving me a name.  I'll remember.  I promise.")
  end

  match _ do
    send_resp_with_message(conn, 404, "Look away.  Nothing to see here.")
  end

  defp send_resp_with_message(conn, http_code, msg) do
    conn
    |> send_resp(http_code, append_time_to_message(msg))
  end

  defp append_time_to_message(msg) do
    utc_time =
      DateTime.utc_now()
      |> DateTime.to_string()

    Enum.join([msg, "The current UTC time is #{utc_time}."], "\n\n")
    |> String.trim()
  end
end
