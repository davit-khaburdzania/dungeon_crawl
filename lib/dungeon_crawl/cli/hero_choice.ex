defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.info("\n Heroes:")
    heroes = DungeonCrawl.Heroes.all()

    heroes
    |> to_options
    |> print_options
    |> parse_answer
    |> choose_hero(heroes)
    |> confirm_hero
  end

  defp clean_start() do
    Shell.cmd("clear")
    start()
  end

  defp choose_hero(answer, heroes) do
    hero = Enum.at(heroes, answer - 1)
    Shell.info("You choose #{hero.description}")
    hero
  end

  defp confirm_hero(hero) do
    case Shell.yes?("Confirm?") do
      true -> %{hero | name: "You"}
      false -> clean_start()
    end
  end
end
