defmodule DungeonCrawl.GameLog do
  defstruct rooms_visited: 0
end

defimpl String.Chars, for: DungeonCrawl.GameLog do
  def to_string(log), do: "****#{log.rooms}****"
end
