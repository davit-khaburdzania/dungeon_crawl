defmodule DungeonCrawl.CLI.LevelChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.GameLevel
  import DungeonCrawl.CLI.BaseCommands

  def start(character) do
    Shell.info("\nPlease chooce level of dificulity:\n")

    GameLevel.all()
    |> to_options
    |> print_options
    |> parse_answer
    |> choose_level(character)
  end

  # defp clean_start() do
  #   Shell.cmd("clear")
  #   start()
  # end

  defp choose_level(answer, character) do
    level = Enum.at(GameLevel.all(), answer - 1)

    Shell.cmd("clear")

    %{character | dificulity_level: level}
  end
end
