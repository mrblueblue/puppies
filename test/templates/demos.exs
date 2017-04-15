defmodule Template.Demos do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  @opts Application.get_env(:beagle, :capabilities)

  setup do
    Hound.start_session @opts
    :ok
  end
end
