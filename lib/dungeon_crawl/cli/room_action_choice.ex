defmodule DungeonCrawl.CLI.RoomActionChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start(room, _hero) do
    Shell.info(room.description)

    room.actions
    |> to_options
    |> print_options
    |> parse_answer
    |> choose_action(room.actions)
  end

  # defp clean_start() do
  #   Shell.cmd("clear")
  #   start()
  # end

  defp to_options(actions) do
    actions
    |> Enum.with_index(1)
    |> Enum.map(fn {action, index} -> "#{index} - #{action.label}" end)
  end

  defp choose_action(answer, actions) do
    action = Enum.at(actions, answer - 1)
    Shell.info("You choose #{action.label}")
    action
  end
end
