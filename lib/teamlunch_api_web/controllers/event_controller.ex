defmodule TeamlunchApiWeb.EventController do
  use TeamlunchApiWeb, :controller

  alias TeamlunchApi.Events

  def events(conn, _params) do
    ev = Events.get_all_events()
    json(conn, ev)
  end

  def create(conn, params) do
    ev = Events.create_event(params)
    json(conn, ev)
  end

  def get(conn, %{"eventId" => evId} = params) do
  end
end
