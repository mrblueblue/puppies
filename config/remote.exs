use Mix.Config

config :hound,
  browser: "chrome",
  driver: "selenium",
  host: System.get_env("HOST"),
  port: 80,
  retry_time: 2000

config :beagle,
  url: System.get_env("URL"),
  animation_timeout: 2000,
  password: System.get_env("PASSWORD"),
  formatters: [Tapex, JUnitFormatter],
  capabilities: %{
    driver: %{
      os: "OS X",
      os_version: "El Capitan",
      platform: "MAC",
      browser: "Chrome",
      browser_version: "52.0",
      resolution: "1024x768",
      "browserstack.local": "true",
      "browserstack.user": System.get_env("USER"),
      "browserstack.key": System.get_env("KEY")
    }
  }

config :junit_formatter,
  report_file: "report_file_test.xml",
  report_dir: "./test",
  print_report_file: true
