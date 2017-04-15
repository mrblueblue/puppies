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

  test "Line Chart" do
    assert Chart.Line.is_valid(@node) == true
  end
end
