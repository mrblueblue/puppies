defmodule PieChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do
    Editor.Chart.create %Chart{
      type: "pie",
      dimensions: [%Selector{value: "carrier_name"}],
      measures: [%Selector{value: "# Records"}],
    }
  end

  @node "#chart1"

  test "Pie Chart" do
    assert Chart.Pie.is_valid(@node) == true
    assert Chart.Pie.num_slices(@node) == 10

    Editor.Settings.num_groups(3)
    assert Chart.Pie.num_slices(@node) == 3

    Chart.Pie.filter(@node, 0)
    assert Chart.Pie.is_selected_at(@node, 0) == true
  end
end
