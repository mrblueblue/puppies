# beagle

Elixir scripts to automate mind-numbing release checks. Sniffs out bugs for you!

![beagle](https://cloud.githubusercontent.com/assets/9220038/25032366/612899fa-2088-11e7-875b-ddb287952db8.jpg)

## Quick Start

```bash
mix deps.get
mix test
```

## Requirements

* [Elixir 1.4](http://elixir-lang.org/install.html)
* [Erlang/OTP 19](http://erlang.org/doc/installation_guide/INSTALL.html)
* [Selenium](https://www.npmjs.com/package/selenium-standalone)

## Running

Install dependencies first using

```bash
mix deps.get
```
### Locally

Assuming you have Selenium server with the Chrome driver running on port `4444`:

```bash
mix test
```

### Remotely

The script relies on the environmental variables `USER`, `KEY` and `HOST`, which represent your Browserstack username, access key, and remote endpoint.

You can set these variables in an `.env` file like

```bash
export USER="example"
export KEY="example"
export HOST="http://${USER}:${KEY}@hub-cloud.browserstack.com"
```

and then run:

```bash
source .env
```
Once these variables are set, you can run the Browserstack remote tests with:

```bash
ENV=remote mix test
```

## Resources

* https://github.com/HashNuke/hound
* http://elixir-lang.org/getting-started/introduction.html
* https://github.com/SeleniumHQ/selenium/wiki/JsonWireProtocol
* http://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
* https://hexdocs.pm/ex_unit/ExUnit.html
