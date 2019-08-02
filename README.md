# Zendesk

A lightweight Elixir wrapper for Zendesk.

## Installation

Add `zendesk` to your list of dependencies in `mix.exs`:

```elixir
def deps, do: [{:zendesk, github: "poops/zendesk"}]
```

Setup your config:
```elixir
  config :zendesk,
    subdomain: "zendesk-sub-domain",
    username: "zendesk username",
    password: "zendesk password"
```

## Usage

```
# List tickets
Zendesk.Api.Tickets.list()
Zendesk.Api.Tickets.list(per_page: 10)
```

