defmodule Template.Editor do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  @opts Application.get_env(:chowchow, :capabilities)
  @url "http://immerse-v2-master.dev.frontend.builds.mapd.com/"
  @table "contributions"

  setup do
    Hound.start_session @opts
    navigate_to(@url)
    create_dashboard()
    :ok
  end

  defp create_dashboard do
    click({:css, ".new-dashboard"})
    input_into_field({:css, ".search-input-comp input"}, @table)
    click({:css, ".table-list > div"})
    click({:css, ".table-list > div"})
    click({:css, ".add-chart"})
  end
end
