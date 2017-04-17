defmodule BubbleChartTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard(&create_bubble/1)

  test "Bubble Chart" do
    assert Chart.Bubble.is_valid(@node) == true

    Editor.Settings.num_groups(10)
    assert Chart.Bubble.num_bubbles(@node) <= 10

    Chart.Bubble.filter(@node, 5)
    assert Chart.Bubble.is_selected_at(@node, 5) == true

    Editor.Chart.save()
    assert Chart.Bubble.is_selected_at(@node, 5) == true
  end

  defp create_bubble table do
    Editor.Chart.create %Chart{
      type: "scatter",
      dimensions: [
        %Selector{value: Column.random(table, [:int])},
      ],
      measures: [
        %Selector{value: Column.random(table, [:int, :records])},
        %Selector{value: Column.random(table, [:int, :records])},
        nil,
        %Selector{value: Column.random(table, [:int, :records])},
      ]
    }
  end
end
