defmodule DungeonCrawl.Room.Triggers.Health do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Character

  def run(character, _action) do
    updated_hit_points =
      character
      |> health_points()
      |> max(character.max_hit_points)

    updated_character = %{character | hit_points: updated_hit_points}

    Shell.info("You just gained new health points")
    Character.print_points(updated_character)

    {updated_character, :forward}
  end

  def health_points(character) do
    div(Enum.random(1..20), character.dificulity_level.weight)
  end
end
