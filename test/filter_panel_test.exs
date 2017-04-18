defmodule FilterPanelTest do
  use Template.Editor, async: true
  use Hound.Helpers

  setup do:
    setup_dashboard()

  test("Filter Panel", context) do
    Filter.open_filter_panel()
    Filter.add(%Filter{column: Column.random(context.table, [:string])})
    Filter.add(%Filter{index: 1, column: Column.random(context.table, [:string])})
    IO.inspect Filter.num_filters()
    assert Records.selected !== context.records
  end

end
