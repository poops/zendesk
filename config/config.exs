use Mix.Config

if Mix.env() == :test do
  config :zendesk,
    client: Zendesk.Client.Test,
    subdomain: "test",
    username: "test",
    password: "test"
end
