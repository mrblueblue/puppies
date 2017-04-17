defmodule Beagle.Mixfile do
  use Mix.Project

  def project do
    [app: :beagle,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :hound]]
  end

  defp deps do
    [{:tapex, "~> 0.1.0", only: :test},
     {:junit_formatter, "~> 1.3", only: [:test]},
     {:hound, "~> 1.0"}]
  end
end
