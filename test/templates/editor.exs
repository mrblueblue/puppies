defmodule Template.Editor do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  @opts Application.get_env(:beagle, :capabilities)
  @url "http://localhost:8002"

  @tables [
    "flights",
    "contributions",
    "tweets"
  ]

  setup do
    Hound.start_session @opts
    navigate_to(@url)

    table = Enum.random(@tables)
    create_dashboard(table)
    [table: table]
  end

  defp create_dashboard table do
    click({:css, ".new-dashboard"})
    input_into_field({:css, ".search-input-comp input"}, table)
    click({:css, ".table-list > div"})
    click({:css, ".table-list > div"})
    click({:css, ".add-chart"})
  end
end
