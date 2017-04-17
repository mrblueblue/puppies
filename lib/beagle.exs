defmodule Beagle.Helpers do
  use Hound.Helpers
  @retry_time 500
  @retries 12

  def wait_until_not_visible(element, retries \\ @retries) do
    if retries == 0 do
      {:error, "too many retries"}
    else
      case Hound.Helpers.Page.search_element(:css, element, 0) do
        {:error, _} ->
          {:ok, "Element not found"}
        {:ok, element} ->
          :timer.sleep(@retry_time)
          wait_until_not_visible(element, retries - 1)
      end
    end
  end

  def move_to(element, xoffset, yoffset) do
    element = get_element(element)
    session_id = Hound.current_session_id
    Hound.RequestUtils.make_req(:post, "session/#{session_id}/moveto", %{element: element.uuid, xoffset: xoffset, yoffset: yoffset})
  end

  def mouse_down(button \\ 0) do
    session_id = Hound.current_session_id
    Hound.RequestUtils.make_req(:post, "session/#{session_id}/buttondown", %{button: button})
  end

  def mouse_up(button \\ 0) do
    session_id = Hound.current_session_id
    Hound.RequestUtils.make_req(:post, "session/#{session_id}/buttonup", %{button: button})
  end

  defp get_element({strategy, selector}),
    do: Hound.Helpers.Page.find_element(strategy, selector)

end
