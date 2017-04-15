defmodule Chart.Row do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  def is_valid selector do
    element_displayed?({:css, "#{selector} g.row"})

    find_all_elements(:css, "#{selector} g.row")
      |> Stream.with_index
      |> Enum.all?(&row_class_valid?/1)
  end

  defp row_class_valid? {element, index} do
    attribute_value(element, "class") == "row _#{index}"
  end

  def num_rows selector do
    find_all_elements(:css, "#{selector} g.row")
    |> length
  end

  def filter(selector, index) do
    find_element(:css, "#{selector} g.row._#{index}")
    |> click
    :timer.sleep(Application.get_env(:beagle, :animation_timeout))
  end

  def rows_selected(selector) do
    Chart.Helpers.elements_selected(selector, "g.row rect")
  end

  def is_selected_at(selector, index) do
    Chart.Helpers.is_element_selected_at(selector, "g.row._#{index} rect")
  end
end
