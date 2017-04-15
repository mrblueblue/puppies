defmodule PieChartTest do
  use Template.Immerse, async: true
  use Hound.Helpers

  test "Pie Chart" do
    element_displayed?({:css, ".app-overlay"})
  end
end
