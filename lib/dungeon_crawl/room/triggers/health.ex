defmodule DungeonCrawl.Room.Triggers.Health do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Character

  def run(character, _action) do
    updated_hit_points = 1..10 |> Enum.random() |> max(character.max_hit_points)
    updated_character = %{character | hit_points: updated_hit_points}

    Shell.info("You just gained new health points")
    Character.print_points(updated_character)

    {updated_character, :forward}
  end
end
