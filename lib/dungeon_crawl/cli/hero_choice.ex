defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.GameLog
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.info("\n Heroes:")
    heroes = DungeonCrawl.Heroes.all()

    heroes
    |> to_options
    |> print_options
    |> parse_answer
    |> choose_hero(heroes)
  end

  defp choose_hero(answer, heroes) do
    hero = Enum.at(heroes, answer - 1)
    Shell.info("You choose #{hero.description}")

    %{hero | log: %GameLog{}}
  end
end
