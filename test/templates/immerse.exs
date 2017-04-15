defmodule Template.Immerse do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  @opts Application.get_env(:chowchow, :capabilities)
  @url "http://immerse-v2-master.dev.frontend.builds.mapd.com/"

  setup do
    Hound.start_session @opts
    navigate_to(@url)
    :ok
  end
end
