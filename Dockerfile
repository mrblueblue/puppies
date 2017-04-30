FROM bitwalker/alpine-elixir:1.4.0
ENV MIX_ENV=test
COPY . .
