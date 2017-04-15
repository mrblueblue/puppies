defmodule HeatmapChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "heat",
      dimensions: [
        %Selector{value: Column.random(context.table, [:string, :int])},
        %Selector{value: Column.random(context.table, [:string, :int])}
      ],
      measures: [
        %Selector{value: Column.random(context.table, [:string, :int, :records])},
      ],
    }
  end

  @node "#chart1"

  test "Heatmap Chart" do
    assert Chart.Heatmap.is_valid(@node) == true

    Chart.Heatmap.filter(@node, 0)
    Chart.Heatmap.filter(@node, 2)
    assert Chart.Heatmap.boxes_selected(@node) == [0, 2]
  end
end
