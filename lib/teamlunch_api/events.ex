defmodule TeamlunchApi.Events do
  def get_all_events do
    CubDB.select(CubDB, min_key: {:events, 0}, max_key: {:events, nil})
    |> Enum.map(fn {{_type, key}, val} -> Map.put_new(val, "id", key) end)
    |> dbg()
    # |> Enum.sort_by(& &1.id)
  end

  def create_event(m) do
    event_id =
      CubDB.get_and_update(CubDB, {:ids, :users}, fn entry ->
        case is_nil(entry) do
          true -> {1, 1}
          false -> {entry + 1, entry + 1}
        end
      end)

    CubDB.put(CubDB, {:events, event_id}, m)
  end
end
