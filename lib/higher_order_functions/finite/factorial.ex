defmodule Factorial do
  # *** This is lazy and only takes as many numbers as asked for to calculate
  # the factorial. The limitation here is the high end is limited to 10 million
#  def of(0), do: 1
#  def of(n) when n > 0 do
#    1..10_000_000
#    |> Enum.take(n)
#    |> Enum.reduce(&(&1 * &2))
#  end

  @doc """
    Like the above commented function, this takes the number of Integers passed
    to the function, but isn't limited by a "top end" - it's infinite and with
    the right args will run forever or until machine limitations are reached
  """
  def of(0), do: 1
  def of(n) when n > 0 do
    Stream.iterate(1, &(&1 + 1))
    |> Enum.take(n)
    |> Enum.reduce(&(&1 * &2))
  end
end
