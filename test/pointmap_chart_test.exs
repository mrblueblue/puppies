defmodule PointmapChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_pointmap/1)

  test "Scatter Chart" do
    assert Chart.Raster.is_valid(@node, %{legend: false, use_map: true})
  end

  defp create_pointmap table do
    Editor.Chart.create %Chart{
      type: "pointmap",
      measures: [
        %Selector{value: Column.lon(table)},
        %Selector{value: Column.lat(table)},
      ],
    }
  end
end
