defmodule HeatmapChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_heat/1)

  test "Heatmap Chart" do
    assert Chart.Heatmap.is_valid(@node)

    Chart.Heatmap.filter(@node, 0)
    Chart.Heatmap.filter(@node, 2)
    assert Chart.Heatmap.boxes_selected(@node) == [0, 2]

    Editor.Chart.save()
    assert Chart.Heatmap.boxes_selected(@node) == [0, 2]
  end

  defp create_heat table do
    Editor.Chart.create %Chart{
      type: "heat",
      dimensions: [
        %Selector{value: Column.random(table, [:int])},
        %Selector{value: Column.random(table, [:int])}
      ],
      measures: [
        %Selector{value: Column.random(table, [:string, :int, :records])},
      ],
    }
  end
end
