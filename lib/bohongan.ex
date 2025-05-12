defmodule Bohongan do
  @moduledoc """
  Bohongan is a zero-config JSON server for mocking REST APIs.
  It provides a simple way to create a mock REST API server for development and testing.
  """

  @doc """
  Returns the version of Bohongan.
  """
  def version do
    Application.spec(:bohongan, :vsn)
  end

  @doc """
  Returns the running port of the server.
  """
  def port do
    System.get_env("PORT", "4000")
    |> String.to_integer()
  end
end
