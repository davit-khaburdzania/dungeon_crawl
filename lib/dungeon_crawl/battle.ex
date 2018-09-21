defmodule DungeonCrawl.Buttle do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Character

  def fight(
        char_a = %Character{hit_points: hit_points_a},
        char_b = %Character{hit_points: hit_points_b}
      )
      when hit_points_a === 0 or hit_points_b === 0,
      do: {char_a, char_b}

  def fight(char_a, char_b) do
    char_b_after = attack(char_a, char_b)
    char_a_after = attack(char_b_after, char_a)

    fight(char_a_after, char_b_after)
  end

  def attack(char_a = %{hit_points: hit_points_a}, char_b) when hit_points_a === 0, do: char_b

  def attack(char_a, char_b) do
    damage_point = Enum.random(char_a.damage_range)
    char_b_after = Character.take_damage(char_b, damage_point)

    attack_message(char_a, damage_point) |> Shell.info()
    receive_message(char_b_after, damage_point) |> Shell.info()

    char_b_after
  end

  defp attack_message(character = %{name: "You"}, damage) do
    "You attack with #{character.attack_description} and deal #{damage} damage."
  end

  defp attack_message(character, damage) do
    "#{character.name} attacks with " <>
      "#{character.attack_description} and " <> "deals #{damage} damage."
  end

  defp receive_message(character = %{name: "You"}, damage) do
    "You receive #{damage}. Current HP: #{character.hit_points}"
  end

  defp receive_message(character, damage) do
    "#{character.name} receives #{damage}. Current HP: #{character.hit_points}"
  end
end
