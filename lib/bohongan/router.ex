defmodule Bohongan.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  plug :dispatch

  get "/*path" do
    case Bohongan.Store.get(path) do
      {:ok, data} -> send_json(conn, 200, data)
      {:error, :not_found} -> send_json(conn, 404, %{error: "Not found"})
    end
  end

  post "/*path" do
    with {:ok, body} <- conn.body_params,
         {:ok, _} <- Bohongan.Store.set(path, body) do
      send_json(conn, 201, body)
    else
      _ -> send_json(conn, 400, %{error: "Invalid request"})
    end
  end

  put "/*path" do
    with {:ok, body} <- conn.body_params,
         {:ok, _} <- Bohongan.Store.set(path, body) do
      send_json(conn, 200, body)
    else
      _ -> send_json(conn, 400, %{error: "Invalid request"})
    end
  end

  delete "/*path" do
    case Bohongan.Store.delete(path) do
      :ok -> send_json(conn, 204, nil)
      {:error, :not_found} -> send_json(conn, 404, %{error: "Not found"})
    end
  end

  match _ do
    send_json(conn, 404, %{error: "Not found"})
  end

  defp send_json(conn, status, body) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Jason.encode!(body))
  end
end
