defmodule RowChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do
    Editor.Chart.create %Chart{
      type: "row",
      dimensions: [%Selector{value: "arrdelay"}],
      measures: [%Selector{value: "# Records"}],
    }
  end

  @node "#chart1"

  test "Row Chart" do
    assert Chart.Row.is_valid(@node) == true
    assert Chart.Row.num_rows(@node) == 12

    Editor.Settings.num_groups(5)
    assert Chart.Row.num_rows(@node) == 5

    Chart.Row.filter(@node, 2)
    assert Chart.Row.is_selected_at(@node, 2) == true
  end
end
