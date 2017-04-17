defmodule HistogramChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_histogram/1)

  test("Histogram Chart", context) do
    assert Chart.Histogram.is_valid(@node) == true
    Editor.Chart.save()
    assert Chart.Histogram.is_valid(@node) == true

    Chart.Histogram.brush(@node, [25, 75])
    assert(Records.selected() !== context.records)
  end

  defp create_histogram table do
    Editor.Chart.create %Chart{
      type: "histogram",
      dimensions: [
        %Selector{value: Column.random(table, [:int])},
      ],
      measures: [
        %Selector{value: Column.random(table, [:int, :records])},
      ],
    }
  end
end
