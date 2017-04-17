defmodule Template.Editor do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  using do
    quote do
      @node "#chart1"
      @tables ["flights", "contributions", "tweets"]

      def setup_dashboard(create_chart, tables \\ @tables) do
        table = Enum.random(tables)
        Navigator.new_dashboard(table)
        num_records = Records.selected()
        create_chart.(table)
        [table: table, records: num_records]
      end
    end
  end

  @opts Application.get_env(:beagle, :capabilities)
  @url "http://localhost:8002"

  setup do
    Hound.start_session @opts
    navigate_to(@url)
    :ok
  end

end
