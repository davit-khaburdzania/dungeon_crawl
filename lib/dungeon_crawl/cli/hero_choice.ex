defmodule DungeonCrawl.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.info("\n Heroes:")
    heroes = DungeonCrawl.Heroes.all()

    heroes
    |> print_hero_names
    |> print_options
    |> parse_answer
    |> choose_hero
    |> confirm_hero
  end

  defp clean_start() do
    Shell.cmd("clear")
    start()
  end

  defp print_hero_names(heroes) do
    heroes
    |> Enum.with_index(1)
    |> Enum.map(fn {hero, index} -> "#{index}.#{hero.name}\n" end)
    |> Shell.info()

    heroes
  end

  defp print_options(heroes) do
    options = Enum.join(1..Enum.count(heroes), ",")
    Shell.info("\nPlease Choose your hero: (#{options})")
    heroes
  end

  defp parse_answer(heroes) do
    Shell.prompt("Your Choice")
    |> Integer.parse()
    |> case do
      {answer, _} -> {heroes, answer}
      {:error} -> {heroes, :error}
    end
  end

  defp choose_hero({_heroes, :error}), do: clean_start()

  defp choose_hero({heroes, answer}) do
    hero = Enum.at(heroes, answer - 1)
    Shell.info("You choose #{hero.description}")
    hero
  end

  defp confirm_hero(hero) do
    case Shell.yes?("Confirm?") do
      true -> hero
      false -> clean_start()
    end
  end
end
