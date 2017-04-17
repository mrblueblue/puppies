{:ok, helpers} = File.ls("./test/helpers")
{:ok, templates} = File.ls("./test/templates")

Code.require_file "./lib/beagle.exs"

Enum.each helpers, fn(file) ->
  Code.require_file "helpers/#{file}", __DIR__
end

Enum.each templates, fn(file) ->
  Code.require_file "templates/#{file}", __DIR__
end

opts = [
  max_cases: 4,
  autorun: false,
  formatters: Application.get_env(:beagle, :formatters)
]

Application.ensure_all_started :hound
ExUnit.start opts
