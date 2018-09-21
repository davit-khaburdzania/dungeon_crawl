defmodule DungeonCrawl.Room.Triggers.Exit do
  def run(character, _), do: {character, :exit}
end
