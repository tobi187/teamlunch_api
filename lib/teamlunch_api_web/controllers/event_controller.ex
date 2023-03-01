defmodule TeamlunchApiWeb.EventController do
  use TeamlunchApiWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias TeamlunchApi.Events
  alias TeamlunchApi.Event
  alias TeamlunchApiWeb.Schemas.EventsSchema

  @json "application/json"

  operation :events,
    summary: "get all Events",
    responses: [
      ok: {"Success", @json, EventsSchema.GetEventsRes}
    ]

  def events(conn, _params) do
    ev = Events.get_all_events()
    json(conn, ev)
  end

  operation :create,
    summary: "Create a Event",
    request_body: {"Event Attributes", @json, EventsSchema.CreateBody, required: true},
    responses: [
      ok: {"Success", @json, EventsSchema.CreateRes}
    ]

  def create(conn, params) do
    ev = Events.create_event(params)
    json(conn, ev)
  end

  operation :order,
    summary: "Create Order",
    properties: [
      eventId: [in: :path, required: true]
    ],
    request_body: {"Order Details", @json, EventsSchema.OrderReq, required: true}

  def order(conn, %{"eventId" => evId, "orders" => order} = _params) do
    Event.order(evId, order)
    conn |> json(%{success: true})
  end
end
