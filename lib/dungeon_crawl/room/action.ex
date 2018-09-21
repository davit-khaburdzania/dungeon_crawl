defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct [:id, :label, :trigger]
  @type t :: %Action{id: atom, label: String.t()}

  def forward(trigger), do: %Action{id: :forward, label: "Move forward", trigger: trigger}

  def rest(trigger),
    do: %Action{id: :rest, label: "Take a better look and rest", trigger: trigger}

  def search(trigger), do: %Action{id: :search, label: "Search the room", trigger: trigger}
end

defimpl String.Chars, for: DungeonCrawl.Room.Action do
  def to_string(action), do: action.label
end
