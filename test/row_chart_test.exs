defmodule RowChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_row/1)

  test "Row Chart" do
    assert Chart.Row.is_valid(@node) == true

    Editor.Settings.num_groups(5)
    assert Chart.Row.num_rows(@node) <= 5

    Chart.Row.filter(@node, 1)
    assert Chart.Row.is_selected_at(@node, 1) == true

    Editor.Chart.save()
    assert Chart.Row.is_selected_at(@node, 1) == true
  end

  defp create_row table do
    Editor.Chart.create %Chart{
      type: "row",
      dimensions: [
        %Selector{value: Column.random(table, [:string, :int])},
        %Selector{value: Column.random(table, [:string, :int])}
      ],
      measures: [
        %Selector{value: Column.random(table, [:string, :int, :records])},
      ],
    }
  end
end
