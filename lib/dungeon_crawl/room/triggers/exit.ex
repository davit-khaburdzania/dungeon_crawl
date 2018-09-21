defmodule DungeonCrawl.Room.Triggers.Exit do
  def run(character, _) do
    dificult? = character.dificulity_level.weight > 1

    handle_dificulity(character, dificult?)
  end

  defp handle_dificulity(character, false), do: {character, :exit}
  defp handle_dificulity(character, true), do: {character, Enum.random([:exit, :do_nothing])}
end
