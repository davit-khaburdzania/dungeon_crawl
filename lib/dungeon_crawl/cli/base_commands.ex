defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def to_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.map(fn {option, index} -> "#{index} - #{option}" end)
  end

  def print_options(options) do
    options
    |> Enum.join("\n")
    |> Shell.info()

    options
  end

  def parse_answer(options) do
    message = Enum.join(1..Enum.count(options), ",")

    Shell.prompt("\nYour choice: [#{message}]")
    |> Integer.parse()
    |> case do
      {answer, _} -> answer
      {:error} -> :error
    end
  end
end
