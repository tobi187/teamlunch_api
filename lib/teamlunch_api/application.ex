defmodule TeamlunchApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TeamlunchApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TeamlunchApi.PubSub},
      # Start the Endpoint (http/https)
      TeamlunchApiWeb.Endpoint,
      # Start a worker by calling: TeamlunchApi.Worker.start_link(arg)
      # {TeamlunchApi.Worker, arg}
      {CubDB, data_dir: "data", name: CubDB}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TeamlunchApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TeamlunchApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
