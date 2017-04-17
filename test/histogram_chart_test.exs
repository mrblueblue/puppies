defmodule HistogramChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "histogram",
      dimensions: [
        %Selector{value: Column.random(context.table, [:int])},
      ],
      measures: [
        %Selector{value: Column.random(context.table, [:int, :records])},
      ],
    }
  end

  @node "#chart1"

  test "Histogram Chart" do
    assert Chart.Histogram.is_valid(@node) == true
    Editor.Chart.save()
    assert Chart.Histogram.is_valid(@node) == true
  end
end
