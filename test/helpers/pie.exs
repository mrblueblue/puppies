defmodule Chart.Pie do
  use Hound.Helpers
  import Beagle.Helpers

  def is_valid selector do
    element_displayed?({:css, "#{selector} g.pie-slice"})
    find_all_elements(:css, "#{selector} g.pie-slice")
    |> Stream.with_index
    |> Enum.all?(&slice_valid?/1)
  end

  defp slice_valid? {element, index} do
    attribute_value(element, "class") == "pie-slice _#{index}"
  end

  def num_slices selector do
    length find_all_elements(:css, "#{selector} g.pie-slice")
  end

  def filter(selector, index) do
    click find_element(:css, "#{selector} g.pie-slice._#{index}")
    wait_until_not_visible(".chart-overlay")
    :timer.sleep(Application.get_env(:beagle, :animation_timeout))
  end

  def slices_selected(selector) do
    Chart.Helpers.elements_selected(selector, "g.pie-slice")
  end

  def is_selected_at(selector, index) do
    Chart.Helpers.is_element_selected_at(selector, "g.pie-slice._#{index}")
  end
end
