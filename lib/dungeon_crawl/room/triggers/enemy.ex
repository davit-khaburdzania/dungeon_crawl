defmodule DungeonCrawl.Room.Triggers.Enemy do
  alias Mix.Shell.IO, as: Shell

  def run(character, _action) do
    enemy = random_enemy()

    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You were prepeared and attack first")

    {updated_character, _enemy} = DungeonCrawl.Buttle.fight(character, enemy)
    {updated_character, :forward}
  end

  defp random_enemy, do: DungeonCrawl.Enemies.all() |> Enum.random()
end
