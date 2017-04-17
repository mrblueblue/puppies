defmodule RowChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "row",
      dimensions: [
        %Selector{value: Column.random(context.table, [:string, :int])},
        %Selector{value: Column.random(context.table, [:string, :int])}
      ],
      measures: [
        %Selector{value: Column.random(context.table, [:string, :int, :records])},
      ],
    }
  end

  @node "#chart1"

  test "Row Chart" do
    assert Chart.Row.is_valid(@node) == true

    Editor.Settings.num_groups(5)
    assert Chart.Row.num_rows(@node) <= 5

    Chart.Row.filter(@node, 1)
    assert Chart.Row.is_selected_at(@node, 1) == true

    Editor.Chart.save()
    assert Chart.Row.is_selected_at(@node, 1) == true
  end
end
