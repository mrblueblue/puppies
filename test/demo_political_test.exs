defmodule PoliticalDemoTest do
  use Template.Demos, async: true
  use Hound.Helpers

  @url "http://127.0.0.1:8002"
  @dashboard "US Political Donations"
  @config %{
    host: "titan.mapd.com",
    port: 80
  }

  @bar_spec %{
    legend: [
      text: "Default",
      text: "R",
      text: "D",
      text: "Other"
    ]
  }

  @line_spec %{
    legend: [
      text: "D",
      text: "R",
      text: "L",
      text: "3",
      text: "UNKNOWN",
    ]
  }

  @pointmap_spec %{
    use_map: true,
    legend: [
      text: "Default",
      text: "D",
      text: "R",
      text: "L",
      text: "3",
      text: "I",
      text: "U",
      text: "UNKNOWN",
      text: "Other"
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
  test "Political Demo" do
    assert(Chart.Raster.is_valid("#chart2", @pointmap_spec) == true, "Pointmap chart renders correctly")
    assert(Legend.Ordinal.is_valid("#chart1", @line_spec.legend) == true, "Line chart legend renders correctly")
    assert(Legend.Ordinal.is_valid("#chart3", @bar_spec.legend) == true, "Bar chart legend renders correctly")
  end
end
