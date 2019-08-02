defmodule Zendesk.Client.Http do
  @moduledoc """
  The HTTP client specification.
  """

  @type header :: {binary, binary}
  @type response :: {:ok, 100..599, [header], binary} | {:error, term}

  @callback get(binary, [header], keyword) :: response
  @callback post(binary, [header], binary, keyword) :: response

  @spec get(binary, [header], keyword) :: response
  def get(endpoint, headers, opts),
    do: client().get(url() <> endpoint, headers, [basic_auth: basic_auth()] ++ opts)

  @spec get(binary) :: response
  def get(endpoint), do: get(endpoint, [], [])

  @spec post(binary, [header], binary, keyword) :: response
  def post(endpoint, headers, body, opts),
    do: client().post(url() <> endpoint, headers, body, opts)

  @spec client :: module
  defp client,
    do: Application.get_env(:zendesk, :client, Zendesk.Client.Hackney)

  @spec basic_auth :: {String.t(), String.t()}
  defp basic_auth,
    do: {Application.fetch_env!(:zendesk, :username), Application.fetch_env!(:zendesk, :password)}

  @spec url :: String.t()
  defp url, do: "https://#{subdomain()}.zendesk.com"

  @spec subdomain :: String.t()
  defp subdomain, do: Application.fetch_env!(:zendesk, :subdomain)
end
