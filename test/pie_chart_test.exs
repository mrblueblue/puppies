defmodule PieChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "pie",
      dimensions: [
        %Selector{value: Column.random(context.table, [:string, :int])},
      ],
      measures: [
        %Selector{value: Column.random(context.table, [:string, :int, :records])},
        %Selector{value: Column.random(context.table, [:string, :int, :records])}
      ],
    }
    Beagle.Helpers.wait_until_not_visible(".chart-overlay")
    :ok
  end

  @node "#chart1"

  test "Pie Chart" do
    assert Chart.Pie.is_valid(@node) == true

    Editor.Settings.num_groups(3)
    assert Chart.Pie.num_slices(@node) <= 3

    Chart.Pie.filter(@node, 0)
    assert Chart.Pie.is_selected_at(@node, 0) == true

    Editor.Chart.save()
    assert Chart.Pie.is_selected_at(@node, 0) == true
  end
end
