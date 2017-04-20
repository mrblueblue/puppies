defmodule ChoroplethChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_choropleth/1, ["flights", "contributions"])

  test "Choropleth Chart" do
    click({:css, ".geo-json-dropdown"})
    Editor.Settings.geo_json "US State"
    Chart.Choropleth.filter(@node, "ca")
    assert Chart.Choropleth.is_selected_at(@node, "ca")
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
    :timer.sleep(Application.get_env(:beagle, :animation_timeout) * 2)
  end

end
