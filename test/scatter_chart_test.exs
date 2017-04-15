defmodule ScatterChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "backendScatter",
      measures: [
        %Selector{value: Column.random(context.table, [:int])},
        %Selector{value: Column.random(context.table, [:int])},
      ],
    }
  end

  @node "#chart1"

  @scatter_spec %{
    legend: false,
    use_map: false
  }

  test "Scatter Chart" do
    assert Chart.Raster.is_valid(@node, @scatter_spec) == true
  end
end
