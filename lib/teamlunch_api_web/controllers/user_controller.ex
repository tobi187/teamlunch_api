defmodule TeamlunchApiWeb.UserController do
  use TeamlunchApiWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias TeamlunchApi.Users
  alias TeamlunchApiWeb.Schemas.UserSchema
  @json "application/json"

  operation :login,
    summary: "Login",
    properties: %{
      name: [in: :query, description: "username", required: true]
    },
    responses: [
      ok: {"Login Response", @json, UserSchema.LoginRes}
    ]

  def login(conn, params) do
    uname = Map.get(params, "name")

    case Users.get_user_by_name(uname) do
      {:ok, user} -> json(conn, user)
      {:err, mess} -> conn |> put_status(400) |> json(mess)
    end
  end

  operation :register,
    summary: "Register",
    properties: %{
      name: [in: :query, description: "username", required: true],
      mail: [in: :query, description: "email"]
    },
    responses: [
      ok: {"Login Response", @json, UserSchema.LoginRes}
    ]

  def register(conn, params) do
    uname = Map.get(params, "name")
    mail = Map.get(params, "mail")

    case Users.add_user(uname, mail) do
      {:ok, user} -> json(conn, user)
      {:err, mess} -> conn |> put_status(400) |> json(mess)
    end
  end
end
