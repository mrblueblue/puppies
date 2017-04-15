defmodule RowChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do
    Editor.Chart.create %Chart{
      type: "row",
      dimensions: [%Selector{value: "amount"}],
      measures: [%Selector{value: "# Records"}],
    }
  end

  test "Row Chart" do
    Chart.Row.is_valid("#chart1")
  end
end
