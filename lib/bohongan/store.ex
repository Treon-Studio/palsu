defmodule Bohongan.Store do
  use GenServer
  require Logger

  # Client API

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def get(path) do
    GenServer.call(__MODULE__, {:get, normalize_path(path)})
  end

  def set(path, data) do
    GenServer.call(__MODULE__, {:set, normalize_path(path), data})
  end

  def delete(path) do
    GenServer.call(__MODULE__, {:delete, normalize_path(path)})
  end

  # Server Callbacks

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:get, path}, _from, state) do
    case Map.fetch(state, path) do
      {:ok, value} -> {:reply, {:ok, value}, state}
      :error -> {:reply, {:error, :not_found}, state}
    end
  end

  @impl true
  def handle_call({:set, path, data}, _from, state) do
    new_state = Map.put(state, path, data)
    {:reply, {:ok, data}, new_state}
  end

  @impl true
  def handle_call({:delete, path}, _from, state) do
    case Map.has_key?(state, path) do
      true ->
        new_state = Map.delete(state, path)
        {:reply, :ok, new_state}
      false ->
        {:reply, {:error, :not_found}, state}
    end
  end

  # Private functions

  defp normalize_path(path) when is_list(path) do
    path
    |> Enum.join("/")
    |> normalize_path()
  end

  defp normalize_path(path) when is_binary(path) do
    path
    |> String.trim("/")
  end
end
