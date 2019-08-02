defmodule Zendesk.Api.TicketsTest do
  use ExUnit.Case, async: true

  test "list all" do
    {:ok, resp} = Zendesk.Api.Tickets.list()

    assert 10 == Enum.count(resp["tickets"])
  end

  test "list with params" do
    {:ok, resp} = Zendesk.Api.Tickets.list(per_page: 2)

    assert 2 == Enum.count(resp["tickets"])
  end
end
