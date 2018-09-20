defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    hero = choose_hero()
    rooms = DungeonCrawl.Room.all()
    crawl(hero, rooms)
  end

  def welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find exit.")
  end

  def choose_hero do
    DungeonCrawl.CLI.HeroChoice.start()
  end

  def crawl(hero, rooms) do
    Shell.cmd("clear")
    Shell.info("You keep moving forward to the next room")
    Shell.prompt("Press Enter to continue")

    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionChoice.start(hero)
  end
end
