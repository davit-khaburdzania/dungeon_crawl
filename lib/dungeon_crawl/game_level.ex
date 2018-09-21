defmodule DungeonCrawl.GameLevel do
  alias DungeonCrawl.GameLevel

  defstruct [:id, :label, :weight]
  @type t :: %GameLevel{id: atom, label: String.t(), weight: 1}

  def all,
    do: [
      %GameLevel{id: :easy, label: "Beginner Level", weight: 1},
      %GameLevel{id: :hard, label: "Hard Level", weight: 2}
    ]
end

defimpl String.Chars, for: DungeonCrawl.GameLevel do
  def to_string(action), do: action.label
end
