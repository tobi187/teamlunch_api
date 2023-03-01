defmodule TeamlunchApiWeb.Schemas.EventsSchema do
  require OpenApiSpex
  alias OpenApiSpex.Schema

  defmodule CreateRes do
    OpenApiSpex.schema(%{
      title: "",
      description: "",
      type: :object,
      properties: %{
        eventId: %Schema{type: :integer, description: "Id of created Event"}
      },
      example: %{
        message: "success",
        eventId: 1
      }
    })
  end

  defmodule CreateBody do
    OpenApiSpex.schema(%{
      title: "Create Event Request",
      description: "Creating a new Event",
      type: :object,
      properties: %{
        details: %Schema{
          type: :object,
          required: true,
          properties: %{
            name: %Schema{type: :string, description: "Event Name"},
            creator: %Schema{type: :string, description: "Event Creator"},
            ingridients: %Schema{type: :enum, description: "name of Ingridients"},
            date: %Schema{type: :string, description: "date"}
          }
        }
      }
    })
  end

  defmodule GetEventsRes do
    OpenApiSpex.schema(%{
      title: "Get all Events",
      type: :object,
      example: [
        %{
          name: "SauerkrautParty",
          creator: "Simon Ried",
          ingridients: ["Sauer", "Kraut"],
          date: "01.01.2022"
        }
      ]
    })
  end

  defmodule OrderReq do
    OpenApiSpex.schema(%{
      title: "Order",
      type: :object,
      properties: %{
        userId: %Schema{type: :int, required: true},
        orders: %Schema{type: :object, description: "Order details"}
      },
      example: %{
        userId: 1,
        orders: %{
          Sauer: 2,
          Kraut: 1
        }
      }
    })
  end
end
