defmodule Beagle.Helpers do

  use Hound.Helpers
  @retry_time 500
  @retries 8

  def wait_until_not_visible(element, retries \\ @retries) do
    if retries == 0 do
      {:error, "too many retries"}
    else
      case Hound.Helpers.Page.search_element(:css, element, 0) do
        {:error, err} ->
          {:ok, "Element not found"}
        {:ok, element} ->
          :timer.sleep(@retry_time)
          wait_until_not_visible(element, retries - 1)
      end
    end

  end
end
