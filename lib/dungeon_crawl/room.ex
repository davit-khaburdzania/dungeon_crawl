defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  import DungeonCrawl.Room.Action
  alias DungeonCrawl.Room.Triggers.Exit
  alias DungeonCrawl.Room.Triggers.Enemy
  alias DungeonCrawl.Room.Triggers.Health

  defstruct description: nil, weight: 1, actions: []

  def all,
    do: [
      %Room{
        description: "You found quite place. Looks safe for a little nap",
        weight: 6,
        actions: [forward(Enemy), rest(Health)]
      },
      %Room{
        description: "You are near the cave it looks dangerous ",
        weight: 2,
        actions: [forward(Exit), search(Enemy)]
      },
      %Room{
        description: "You are near the lake and see beautifull house near the lake",
        weight: 8,
        actions: [forward(Enemy), search(Health)]
      }
    ]

  def all_weighted do
    all()
    |> populate_by_weight
    |> Enum.shuffle()
  end

  defp populate_by_weight(array) do
    Enum.reduce(array, [], fn room, result ->
      result ++ List.duplicate(room, room.weight)
    end)
  end
end
