defmodule DungeonCrawl.Room.Triggers.Exit do
  @room_visit_weight 5

  def run(character = %{log: %{rooms_visited: rooms_visited}}, _)
      when rooms_visited < @room_visit_weight,
      do: {character, :do_nothing}

  def run(character, _) do
    dificult? = character.dificulity_level.weight > 1

    handle_dificulity(character, dificult?)
  end

  defp handle_dificulity(character, false), do: {character, :exit}
  defp handle_dificulity(character, true), do: {character, Enum.random([:exit, :do_nothing])}
end
