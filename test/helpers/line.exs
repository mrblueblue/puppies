defmodule Chart.Line do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  def is_valid selector do
    axis_renders?(selector) && line_renders?(selector)
  end

  defp line_renders? selector do
    line_path = "#{selector} path.line"
    element_displayed?({:css, line_path})
    find_all_elements(:css, line_path)
      |> Enum.all?(&(element_displayed?(&1)))
  end

  defp axis_renders? selector do
    element_displayed?({:css, "#{selector} .axis.x"})
    element_displayed?({:css, "#{selector} .axis.y"})
  end

  def brush(selector, [brush_start, brush_end]) do
    Beagle.Helpers.move_to({:css, "#{selector} .brush"}, brush_start, 50)
    Beagle.Helpers.mouse_down()
    Beagle.Helpers.move_to({:css, "#{selector} .brush"}, brush_end, 50)
    Beagle.Helpers.mouse_up()
    Beagle.Helpers.wait_until_not_visible(".chart-overlay")
  end
end
