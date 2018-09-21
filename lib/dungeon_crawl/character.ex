defmodule DungeonCrawl.Character do
  alias Mix.Shell.IO, as: Shell

  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil,
            dificulty: :easy

  @type t :: %DungeonCrawl.Character{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer,
          max_hit_points: non_neg_integer,
          attack_description: String.t(),
          damage_range: Range.t()
        }

  def take_damage(character, points) do
    new_points = max(0, character.hit_points - points)

    %{character | hit_points: new_points}
  end

  def heal(character, points) do
    new_points = max(character.max_hit_points, character.hit_points + points)

    %{character | hit_points: new_points}
  end

  def print_points(character) do
    Shell.info("Your current points are: #{character.hit_points}/#{character.max_hit_points}")
  end
end

defimpl String.Chars, for: DungeonCrawl.Character do
  def to_string(character), do: character.name
end
