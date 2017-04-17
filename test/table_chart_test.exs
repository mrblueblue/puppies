defmodule TableChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_table/1)

  test("Table Chart", context) do
    assert(Chart.Table.is_valid(@node), "Table chart should be rendered")
    assert(sorting_valid(), "Table chart should be able to be sorted")
    assert(crossfiltering_valid(context.records), "Table chart should crossfilter")
  end

  defp create_table table do
    Editor.Chart.create %Chart{
      type: "table",
      dimensions: [
        %Selector{value: Column.random(table, [:string, :int])},
      ],
      measures: [
        %Selector{value: Column.random(table, [:string, :int, :records])},
      ],
    }
  end

  defp sorting_valid do
    initial = Chart.Table.rows_as_text(@node)
    Chart.Table.sort(@node, 0)
    desc = Chart.Table.rows_as_text(@node)
    Chart.Table.sort(@node, 0)
    asc = Chart.Table.rows_as_text(@node)
    Chart.Table.sort(@node, 0)

    has_updated = initial != asc && asc != desc
    Chart.Table.rows_as_text(@node) == initial && has_updated
  end

  defp crossfiltering_valid records do
    Chart.Table.filter(@node, 0)
    count_updated = Records.selected() !== records
    Chart.Table.is_selected_at(@node, 0) && count_updated
  end
end
