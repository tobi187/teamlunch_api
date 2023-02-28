defmodule TeamlunchApiWeb.UserController do
  use TeamlunchApiWeb, :controller

  alias TeamlunchApi.Users

  def login(conn, params) do
    uname = Map.get(params, "name")
    mail = Map.get(params, "mail")

    case Users.add_user(uname, mail) do
      {:ok, user} -> json(conn, user)
      {:err, mess} -> conn |> put_status(400) |> json(mess)
    end
  end
end
