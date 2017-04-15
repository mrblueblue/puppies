Application.ensure_all_started(:hound)

Code.require_file("test/templates/demos.exs")
Code.require_file("test/templates/immerse.exs")

Code.require_file("test/helpers/chart.exs")
Code.require_file("test/helpers/line.exs")
Code.require_file("test/helpers/raster.exs")
Code.require_file("test/helpers/row.exs")
Code.require_file("test/helpers/legend.exs")

ExUnit.start()
