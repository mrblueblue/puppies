defmodule PieChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do
    Editor.Chart.create %Chart{
      type: "pie",
      dimensions: [%Selector{value: "recipient_part"}],
      measures: [%Selector{value: "# Records"}],
    }
  end

  test "Pie Chart" do
    Chart.Pie.is_valid("#chart1")
  end
end
