defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    choose_hero()
  end

  def welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find exit.")
  end

  def choose_hero do
    DungeonCrawl.HeroChoice.start()
  end
end
