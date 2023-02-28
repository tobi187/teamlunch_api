defmodule TeamlunchApiWeb.ApiSpec do
  alias OpenApiSpex.{OpenApi, Server, Info, Paths}
  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        Server.from_endpoint(TeamlunchApiWeb.Endpoint)
      ],
      info: %Info{
        title: to_string(Application.spec(:teamlunch_api, :description)),
        version: to_string(Application.spec(:teamlunch_api, :vsn))
      },
      paths: Paths.from_router(TeamlunchApiWeb.Router)
    }
    |> OpenApiSpex.resolve_schema_modules()
  end
end
