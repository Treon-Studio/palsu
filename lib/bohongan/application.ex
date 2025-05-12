defmodule Bohongan.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Bohongan.Router, options: [port: port()]},
      {Bohongan.Store, []}
    ]

    opts = [strategy: :one_for_one, name: Bohongan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp port do
    System.get_env("PORT", "4000")
    |> String.to_integer()
  end
end
