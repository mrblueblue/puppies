defmodule LineChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "line",
      dimensions: [
        %Selector{value: Column.random(context.table, [:int])},
      ],
      measures: [
        %Selector{value: Column.random(context.table, [:int, :records])},
      ],
    }
  end

  @node "#chart1"

  test("Line Chart", context) do
    assert(Chart.Line.is_valid(@node), "Line chart should render")
    Chart.Line.brush(@node, [25, 75])
    assert(Records.selected() !== context.records)
  end
end
