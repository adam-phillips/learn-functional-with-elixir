defmodule UpdatedScrewFactory do
  @moduledoc """
    This module builds onto the ScrewFactory to include an additional step in
    the manufacturing of screws for packing. Screws can be packed 30 to a
    pack and the process takes 70 ms. A properly packed screw will show
    printed as "|o---|"
  """

  @doc """
    Accept any number of pieces and batch them into chunks of 50 to be passed
    to add_thread/1. Flatten, then send chunks of 100 to add_head/1 and flatten.
    Once "built", send chunks of 30 screws to pack/1 before a final flattening
    and printing of the results. Adding threads takes 50ms, adding the heads
    takes 100ms, and packing takes 70ms
  """
  def run(pieces) do
    pieces
    |> Stream.chunk_every(50)
    |> Stream.flat_map(&add_thread/1)
    |> Stream.chunk_every(100)
    |> Stream.flat_map(&add_head/1)
    |> Stream.chunk_every(30)
    |> Stream.flat_map(&pack/1)
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

  defp pack(screws) do
    Process.sleep(70)
    Enum.map(screws, &("|" <> &1 <> "|"))
  end

  defp output(screw) do
    IO.inspect(screw)
  end
end
