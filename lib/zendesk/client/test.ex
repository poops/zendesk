defmodule Zendesk.Client.Test do
  @moduledoc """
  A test HTTP client implementation.
  """

  alias Zendesk.{Api.Tickets, Client.Http}

  @behaviour Http

  @tickets_endpoint Tickets.endpoint()

  @impl Http
  def get(url, _headers, _opts),
    do:
      url
      |> URI.parse()
      |> handle_get_uri()

  @impl Http
  def post(url, _headers, _body, _opts), do: url

  @spec handle_get_uri(URI.t()) :: {:ok, 200, [], String.t()}
  defp handle_get_uri(%URI{path: @tickets_endpoint, query: "per_page=2"}),
    do:
      {:ok, 200, [],
       ~s|{"count":100,"next_page":null,"previous_page":null,"tickets":[#{tickets(2)}]}|}

  defp handle_get_uri(%URI{path: @tickets_endpoint}),
    do:
      {:ok, 200, [],
       ~s|{"count":100,"next_page":null,"previous_page":null,"tickets":[#{tickets(10)}]}|}

  @spec tickets(pos_integer) :: String.t()
  defp tickets(count) do
    1..count
    |> Stream.map(&~s|{"id":#{&1}}|)
    |> Enum.join(",")
  end
end
