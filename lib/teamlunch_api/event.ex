defmodule TeamlunchApi.Event do
  def order(evId, map) do
    userid = Map.get(map, "userId")
    CubDB.put(CubDB, {evId, userid}, map)
  end

  def get_order(evId, userId) do
    CubDB.get(CubDB, {evId, userId})
  end

  def change_order(evId, map) do
    userId = Map.get(map, "userId")
    CubDB.put(CubDB, {evId, userId}, map)
  end
end
