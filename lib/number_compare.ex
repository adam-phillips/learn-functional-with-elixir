defmodule NumberCompare do
#  Original take, without guard:

#  def greater(number, other_number) do
#    check(number >= other_number, number, other_number)
#  end
#
#  defp check(true, number, _), do: number
#  defp check(false, _, other_number), do: other_number

  @doc """
    Using guard clause to replace extra functions shown above. If the first
    number is greater than or equal, the first function will return. Otherwise
    the only possibility is the `other_number`, which will return. The `when`
    acts as a guard clause
  """
  def greater(number, other_number) when number >= other_number, do: number
  def greater(_, other_number), do: other_number

  @doc """
    Here is the same logic using an anonymous function, still with a guard
    clause:

    number_compare = fn
      number, other_number when number >= other_number -> number
      _, other_number -> other_number
    end

    iex> number_compare.(1, 2)
    2 (return value - the larger number)
  """
end
