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
    IO.inspect attribute_value({:css, "body"}, "class")
    assert(Chart.Line.is_valid(@node), "Line chart should render")
  end
end
