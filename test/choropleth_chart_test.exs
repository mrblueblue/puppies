defmodule ChoroplethChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  @node "#chart1"
  @tables ["flights", "contributions"]

  setup do
    setup_dashboard(&create_choropleth/1, @tables)
  end

  test "Choropleth Chart" do
    click({:css, ".geo-json-dropdown"})
    Editor.Settings.geo_json "US State"
    :timer.sleep(3000)
    Chart.Choropleth.filter(@node, "ca")
    :timer.sleep(10000)
  end

  defp create_choropleth table do
    Editor.Chart.create %Chart{
      type: "choropleth",
      dimensions: [
        %Selector{value: "state"}
      ],
      measures: [
        %Selector{value: Column.random(table, [:int])}
      ]
    }
  end

end
