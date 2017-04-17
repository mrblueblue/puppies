defmodule PointmapChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  @node "#chart1"
  @scatter_spec %{
    legend: false,
    use_map: true
  }

  setup do
    setup_dashboard(&create_pointmap/1)
  end

  test "Scatter Chart" do
    assert Chart.Raster.is_valid(@node, @scatter_spec) == true
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
