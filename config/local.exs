use Mix.Config

config :hound,
  browser: "chrome",
  driver: "selenium",
  port: 4444,
  retry_time: 1500

config :beagle,
  formatters: [Tapex],
  animation_timeout: 1500,
  password: System.get_env("PASSWORD")
