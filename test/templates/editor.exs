defmodule Template.Editor do
  use ExUnit.CaseTemplate
  use Hound.Helpers

  @opts Application.get_env(:beagle, :capabilities)
  @url "http://localhost:8002"

  using do
    quote do
      @tables [
        "flights",
        "contributions",
        "tweets"
      ]
      def setup_dashboard(create_chart, tables \\ @tables) do
        table = Enum.random(tables)
        create_dashboard(table)
        num_records = Records.selected()
        create_chart.(table)
        [table: table, records: num_records]
      end

      defp create_dashboard table do
        click({:css, ".new-dashboard"})
        input_into_field({:css, ".search-input-comp input"}, table)
        click({:css, ".table-list > div"})
        click({:css, ".table-list > div"})
        click({:css, ".add-chart"})
      end
    end
  end

  setup context do
    IO.inspect context
    Hound.start_session @opts
    navigate_to(@url)
    :ok
  end

end
