defmodule DungeonCrawl.CLI.RoomActionChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start(room) do
    Shell.info(room.description)

    room.actions
    |> to_options
    |> print_options
    |> parse_answer
    |> choose_action(room)
  end

  # defp clean_start() do
  #   Shell.cmd("clear")
  #   start()
  # end

  defp choose_action(answer, room) do
    action = Enum.at(room.actions, answer - 1)
    Shell.info("You choose #{action.label}")
    {room, action}
  end
end
