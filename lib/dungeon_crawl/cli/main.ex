defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()

    choose_character()
    |> choose_dificulity_level
    |> crawl(all_rooms())
  end

  def welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find exit.")
  end

  def choose_character() do
    DungeonCrawl.CLI.HeroChoice.start()
  end

  def choose_dificulity_level(character) do
    DungeonCrawl.CLI.LevelChoice.start(character)
  end

  def crawl(character, rooms) do
    Shell.info("\nYou keep moving forward to the next room\n")
    Shell.prompt("Press Enter to continue\n")

    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionChoice.start()
    |> trigger_action(character)
    |> increase_room_log_count
    |> handle_action_result
  end

  defp all_rooms, do: DungeonCrawl.Room.all_weighted()

  defp trigger_action({_room, action}, character) do
    Shell.cmd("clear")
    action.trigger.run(character, action)
  end

  defp handle_action_result({_character, :exit}) do
    Shell.info("You just found exit. You won the game congretulations")
  end

  defp handle_action_result({character, _result}), do: crawl(character, all_rooms())

  defp increase_room_log_count({character, action}) do
    log = character.log
    updated_character = %{character | log: %{log | rooms_visited: log.rooms_visited + 1}}

    {updated_character, action}
  end
end
