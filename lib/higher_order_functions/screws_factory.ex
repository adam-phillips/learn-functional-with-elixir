defmodule ScrewsFactory do
  # This is the eager strategy for processing, where every function has to
  # finish before the next can run. add_thread/1 is called for each "piece"
  # passed, then add_head/1 is called for each piece, and finally output/1 is
  # called for each piece. The sleep times are to simulate actual processing.
  # Example:
  # iex> metal_pieces = Enum.take(Stream.cycle(["-"]), 1000)
  # iex> ScrewsFactory.run(metal_pieces)
  #
  # This sends 1000 pieces and cycles through them. The wait is extremely long
  # before finally printing "o---" 1000 times
  #
  # In actual practice, this simulates things like API calls where each call
  # may take a few milliseconds. Many calls compound the time greatly if made
  # using the eager strategy
#  def run(pieces) do
#    pieces
#    |> Enum.map(&add_thread/1)
#    |> Enum.map(&add_head/1)
#    |> Enum.each(&output/1)
#  end
#
#  defp add_thread(piece) do
#    Process.sleep(50)
#    piece <> "--"
#  end
#
#  defp add_head(piece) do
#    Process.sleep(100)
#    "o" <> piece
#  end
#
#  defp output(screw) do
#    IO.inspect(screw)
#  end

# --------------------------------------------------------------------------- #

#    This is the same as the above commented series of functions, but run/1
#    is now implementing the lazy strategy. In this case each piece that's
#    passed "streams" from one function to the other so instead of waiting for
#    one big block of output at the end there's a constant stream of output
#    one by one
#
#  def run(pieces) do
#    pieces
#    |> Stream.map(&add_thread/1)
#    |> Stream.map(&add_head/1)
#    |> Enum.each(&output/1)
#  end
#
#  defp add_thread(piece) do
#    Process.sleep(50)
#    piece <> "--"
#  end
#
#  defp add_head(piece) do
#    Process.sleep(100)
#    "o" <> piece
#  end
#
#  defp output(screw) do
#    IO.inspect(screw)
#  end

  @doc """
    This is another, faster iteration that also uses the lazy strategy. In
    this case, instead of being processed one by one, the pieces passed in are
    batch processed with Stream.chunk_every/2. Each batch is being processed
    while the next is being collected. Stream.flat_map/2 returns a new list with
    the enumerable result of a function appended

    This approach finishes 1000 pieces in roughly less than 2 seconds, while
    even the lazy approach above took close to a minute (compared to multiple
    minutes with the eager approach)

    To see this in isolation (this uses Enum functions, but Stream is the same):

    iex> Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)
    > [[1, 2], [3, 4], [5, 6]]

    This takes a list and breaks it into smaller lists the size of the second
    argument - in this case 2

    iex> Enum.flat_map([[1, 2], [3, 4], [5, 6]], &(&1))
    > [1, 2, 3, 4, 5, 6]

    This flattens the list of lists into a single list
  """
  def run(pieces) do
    pieces
    |> Stream.chunk_every(50)
    |> Stream.flat_map(&add_thread/1)
    |> Stream.chunk_every(100)
    |> Stream.flat_map(&add_head/1)
    |> Enum.each(&output/1)
  end

  defp add_thread(pieces) do
    Process.sleep(50)
    Enum.map(pieces, &(&1 <> "--"))
  end

  defp add_head(pieces) do
    Process.sleep(100)
    Enum.map(pieces, &("o" <> &1))
  end

  defp output(screw) do
    IO.inspect(screw)
  end
end
