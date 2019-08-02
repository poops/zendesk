defmodule Zendesk.MixProject do
  use Mix.Project

  def project,
    do: [
      app: :zendesk,
      deps: deps(),
      start_permanent: Mix.env() == :prod,
      test_paths: ["lib"],
      version: "0.1.0"
    ]

  def application,
    do: [
      extra_applications: [:logger]
    ]

  defp deps,
    do: [
      {:hackney, "~> 1.15"},
      {:jason, "~> 1.1"}
    ]
end
