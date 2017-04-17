defmodule ScatterChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_scatter/1)

  test "Scatter Chart" do
    assert Chart.Raster.is_valid(@node, %{legend: false, use_map: false})
  end

  defp create_scatter table do
    Editor.Chart.create %Chart{
      type: "backendScatter",
      measures: [
        %Selector{value: Column.random(table, [:int])},
        %Selector{value: Column.random(table, [:int])},
      ],
    }
  end
end
