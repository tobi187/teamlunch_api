defmodule TeamlunchApiWeb.Schemas.UserSchema do
  require OpenApiSpex

  defmodule LoginRes do
    OpenApiSpex.schema(%{
      title: "User Login",
      example: %{
        id: 99,
        name: "Moneyboy Swag"
      }
    })
  end

  defmodule RegisterRes do
    OpenApiSpex.schema(%{
      title: "User register",
      example: %{
        id: 99,
        name: "Moneyboy Swag"
      }
    })
  end
end
