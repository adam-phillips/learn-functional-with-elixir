defmodule FibonacciGenerator do
  @moduledoc """
    This module generates the Fibonacci sequence up to a given quantity, with
    an upper bounds of infinity. For clarity, the Fibonacci sequence is a
    sequence of integers that starts with 0 and 1, then proceeds with each
    subsequent integer being a result of the sum of the 2 preceding integers
  """

  @doc """
    The generator accepts the quantity, which is the number of items in the
    Fibonacci sequence requested.

    Stream.unfold/2 takes an accumulator and a function, and generates values
    by calling the function with the previous accumulator. It returns a
    tuple with the now current value and the next accumulator. Here, the
    initial accumulator is a tuple of the first two values in the Fibonacci
    sequence

    This is piped into Enum.take/2 which takes a given number of results from
    an enumerable and returns a list of that length. So in this case, even if
    the quantity is requested as 1, only 0 will be returned as the first item
    in the list
  """
  def generate(quantity) do
    Stream.unfold({0, 1}, fn {num1, num2} -> {num1, {num2, num1 + num2}} end)
    |> Enum.take(quantity)
  end
end
