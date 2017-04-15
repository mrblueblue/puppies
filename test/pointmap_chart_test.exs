defmodule PointmapChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "pointmap",
      measures: [
        %Selector{value: Column.lon(context.table)},
        %Selector{value: Column.lat(context.table)},
      ],
    }
  end

  @node "#chart1"

  @pointmap_spec %{
    legend: false,
    use_map: true
  }

  test "Pointmap Chart" do
    assert Chart.Raster.is_valid(@node, @pointmap_spec) == true
  end
end
