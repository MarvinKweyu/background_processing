defmodule BackgroundProcessing.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BackgroundProcessingWeb.Telemetry,
      # Start the Ecto repository
      BackgroundProcessing.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BackgroundProcessing.PubSub},
      # Start Finch
      {Finch, name: BackgroundProcessing.Finch},
      # Start the Endpoint (http/https)
      BackgroundProcessingWeb.Endpoint
      # Start a worker by calling: BackgroundProcessing.Worker.start_link(arg)
      # {BackgroundProcessing.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BackgroundProcessing.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BackgroundProcessingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
