defmodule Bohongan.MixProject do
  use Mix.Project

  def project do
    [
      app: :bohongan,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A zero-config JSON server for mocking REST APIs",
      package: package(),
      releases: releases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Bohongan.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.6"},
      {:jason, "~> 1.4"},
      {:uuid, "~> 1.1"},
      {:protobuf, "~> 0.12.0"},
      {:logger_file_backend, "~> 0.0.13"}
    ]
  end

  defp package do
    [
      name: "bohongan",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/raizora/bohongan"}
    ]
  end

  defp releases do
    [
      bohongan: [
        include_executables_for: [:unix],
        applications: [runtime_tools: :permanent],
        steps: [:assemble, :tar],
        strip_beams: Mix.env() == :prod
      ]
    ]
  end
end
