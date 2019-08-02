defmodule Zendesk.Api.Tickets do
  @moduledoc """
  https://developer.zendesk.com/rest_api/docs/support/tickets
  """

  alias Zendesk.Client.Http

  @spec endpoint :: String.t()
  def endpoint, do: "/api/v2/tickets.json"

  @spec list(keyword) :: {:ok, map} | any
  def list(params \\ []) do
    case Http.get("#{endpoint()}?#{URI.encode_query(params)}") do
      {:ok, 200, _headers, body} ->
        {:ok, Jason.decode!(body)}

      resp ->
        resp
    end
  end
end
