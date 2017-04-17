defmodule LineChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_line/1)

  test("Line Chart", context) do
    assert(Chart.Line.is_valid(@node), "Line chart should render")
    Chart.Line.brush(@node, [25, 75])
    assert(Records.selected() !== context.records)
  end

  defp create_line table do
    Editor.Chart.create %Chart{
      type: "line",
      dimensions: [
        %Selector{value: Column.random(table, [:int])},
      ],
      measures: [
        %Selector{value: Column.random(table, [:int, :records])},
      ],
    }
  end
end
