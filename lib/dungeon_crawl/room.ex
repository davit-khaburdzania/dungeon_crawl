defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  import DungeonCrawl.Room.Action
  alias DungeonCrawl.Room.Triggers.Exit
  alias DungeonCrawl.Room.Triggers.Enemy

  defstruct description: nil, actions: []

  def all,
    do: [
      %Room{
        description: "You found quite place. Looks safe for a little nap",
        actions: [forward(Enemy), rest(Exit)]
      }
    ]
end
