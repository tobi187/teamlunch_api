defmodule TeamlunchApi.Users do
  # alias CubDB

  def str_valid?(str), do: is_binary(str) && str !== ""

  def get_user_by_name(name) do
    if str_valid?(name) do
      user =
        CubDB.select(CubDB, min_key: {:users, 0}, max_key: {:users, nil})
        |> Stream.map(fn {_key, val} -> val end)
        |> Enum.find(fn e -> e.name == name end)

      case user do
        nil -> {:err, "not found"}
        _ -> {:ok, user}
      end
    else
      {:err, "invalid username"}
    end
  end

  def add_user(name, mail) do
    if str_valid?(name) do
      uId =
        CubDB.get_and_update(CubDB, {:ids, :users}, fn entry ->
          case is_nil(entry) do
            true -> {1, 1}
            false -> {entry + 1, entry + 1}
          end
        end)

      user = %{id: uId, name: name, mail: mail}

      CubDB.put(CubDB, {:users, uId}, user)

      {:ok, user}
    else
      {:err, "invalid name"}
    end
  end
end
