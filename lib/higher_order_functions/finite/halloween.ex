defmodule Halloween do
  @doc """
    Use Stream.cycle to cycle through a list one after the other, and once for
    each list item passed. So:
    iex> Halloween.give_candy(~w(Mike Anna Ted Mary Alex Emma))

    returns:

    [
      {"chocolate", "Mike"},
      {"jelly", "Anna"},
      {"mint", "Ted"},
      {"chocolate", "Mary"},
      {"jelly", "Alex"},
      {"mint", "Emma"}
    ]
  """
  def give_candy(kids) do
    ~w(chocolate jelly mint)
    |> Stream.cycle
    |> Enum.zip(kids)
  end
end
