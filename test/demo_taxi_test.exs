defmodule MapDTaxiDemoTest do
  use Template.Demos, async: true
  use Hound.Helpers

  @url "https://www.mapd.com/demos/taxis/"

  @legend [
    text: "Manhattan",
    text: "Queens",
    text: "Brooklyn",
    text: "Bronx",
    text: "Staten Island",
    text: "Other",
    ]

  test "Taxi Demo" do
    navigate_to(@url)
    element_displayed?({:css, ".app-overlay"})
    all_charts_rendered()
  end

  defp all_charts_rendered do
    assert(Chart.Raster.is_valid("#chart1", @legend) == true, "Pointmap chart renders correctly")
    assert(Chart.Row.is_valid("#chart2") == true, "Row chart renders correctly")
    assert(Chart.Line.is_valid("#chart3") == true, "Line chart renders correctly")
  end
end
