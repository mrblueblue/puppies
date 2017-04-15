defmodule PieChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do
    Editor.Chart.create %Chart{
      type: "pie",
      dimensions: [
        %Selector{value: Column.random([:string, :int])},
        %Selector{value: Column.random([:string, :int])}
      ],
      measures: [
        %Selector{value: Column.random([:string, :int, :records])},
        %Selector{value: Column.random([:string, :int, :records])}
      ],
    }
  end

  @node "#chart1"

  test "Pie Chart" do
    assert Chart.Pie.is_valid(@node) == true

    Editor.Settings.num_groups(3)
    assert Chart.Pie.num_slices(@node) == 3

    Chart.Pie.filter(@node, 0)
    assert Chart.Pie.is_selected_at(@node, 0) == true
  end
end
