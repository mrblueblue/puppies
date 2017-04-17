defmodule BubbleChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup context do
    Editor.Chart.create %Chart{
      type: "scatter",
      dimensions: [
        %Selector{value: Column.random(context.table, [:int])},
      ],
      measures: [
        %Selector{value: Column.random(context.table, [:int, :records])},
        %Selector{value: Column.random(context.table, [:int, :records])},
        nil,
        %Selector{value: Column.random(context.table, [:int, :records])},
      ]
    }
  end

  @node "#chart1"

  test "Bubble Chart" do
    assert Chart.Bubble.is_valid(@node) == true

    Editor.Settings.num_groups(10)
    assert Chart.Bubble.num_bubbles(@node) <= 10

    Chart.Bubble.filter(@node, 5)
    assert Chart.Bubble.is_selected_at(@node, 5) == true

    Editor.Chart.save()
    assert Chart.Bubble.is_selected_at(@node, 5) == true
  end
end
