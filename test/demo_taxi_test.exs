defmodule MapDTaxiDemoTest do
  use Template.Demos, async: true
  use Hound.Helpers

  @url "http://127.0.0.1:8002"
  @dashboard "NYC Taxi Rides"
  @config %{
    host: "colossus.mapd.com",
    port: 9092
  }

  @pointmap_spec %{
    use_map: true,
    legend: [
      text: "Manhattan",
      text: "Queens",
      text: "Brooklyn",
      text: "Bronx",
      text: "Staten Island",
      text: "Other",
    ]
  }

  setup do
    navigate_to(@url)
    Navigator.logout()
    Navigator.login(@config)
    Navigator.dashboard(@dashboard)
    :ok
  end

  @tag :demo
  test "Taxi Demo" do
    assert(Chart.Raster.is_valid("#chart1", @pointmap_spec) == true, "Pointmap chart renders correctly")
    assert(Chart.Row.is_valid("#chart2") == true, "Row chart renders correctly")
    assert(Chart.Line.is_valid("#chart3") == true, "Line chart renders correctly")
  end
end
