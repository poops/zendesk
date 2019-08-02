defmodule Zendesk.Client.Hackney do
  @moduledoc """
  A hackney HTTP client implementation.
  """

  alias Zendesk.Client.Http

  @behaviour Http

  @impl Http
  def get(url, headers, opts), do: :hackney.get(url, headers, "", [with_body: true] ++ opts)

  @impl Http
  def post(url, headers, body, opts),
    do: :hackney.post(url, headers, body, [with_body: true] ++ opts)
end
