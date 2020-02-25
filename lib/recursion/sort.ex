defmodule Sort do
  @moduledoc """
    Module demonstrating the Divide and Conquer technique for approaching
    recursion. Divide data into smaller components that can more easily be
    dealt with, then Conquer the solution by working with simpler data
  """

  @doc """
    Functions:
    1) Catch clause that stops recursion when the list has been reduced to empty
    2) Handle a single element list, where there is nothing to split
    3) Function that handles the work of splitting a list in half using the
       Kernel function div/2 to obtain the value to split by and avoid float
       values. Then assign the halves of lists to a tuple
  """
  def ascending([]), do: []
  def ascending([a]), do: [a]
  def ascending(list) do
#    half_size = div(Enum.count(list), 2)
    half_size(list)
    {list_a, list_b} = Enum.split(list, half_size(list))
    asc_merge(
      ascending(list_a),
      ascending(list_b)
    )
  end

  def descending([]), do: []
  def descending([a]), do: [a]
  def descending(list) do
    half_size(list)
    {list_a, list_b} = Enum.split(list, half_size(list))
    desc_merge(
      descending(list_a),
      descending(list_b)
    )
  end

  defp half_size(list), do: div(Enum.count(list), 2)

#    Group of functions that recursively merge lists from the smallest value to
#    the largest. The catch clauses stop operation when passed an empty list as
#    either argument. The other two functions do the work of merging, first
#    comparing the two list heads to see which is bigger.
#
#    If the head of the first list is smaller, it's added as the head of what
#    will become a final list, with the tail recursively calling merge/2 with the
#    entire second list and tail of the first list.
#
#    If the head of the first list is larger, the second list head is added as
#    head of what's becoming the final list, with the tail recursively calling
#    merge/2 with the entire first list and the tail of the second list.
#
#    We only match the heads, discarding the larger one in favor of the list
#    it's in so the entire list can be used in the recursive call
#
#    An example of merging lists [5, 9] and [1, 4, 5] result in the below
#    because the calls from ascending/1 will have broken the original list into
#    single element lists. So merging [9, 5, 1, 5, 4] iterates like this:
#
#      merge(merge([9], [5]), merge(merge([1], [5]), [4]))
#      merge([5, 9], merge([1, 5], [4]))
#      merge([5, 9], [1, 4, 5])
#      [1, 4, 5, 5, 9]
  defp asc_merge([], list_b), do: list_b
  defp asc_merge(list_a, []), do: list_a
  defp asc_merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b do
    [head_a | asc_merge(tail_a, list_b)]
  end
  defp asc_merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do
    [head_b | asc_merge(list_a, tail_b)]
  end

#    This function works just like the ascending merge recursive calls, but
#    handles merging in a descending order
  defp desc_merge([], list_b), do: list_b
  defp desc_merge(list_a, []), do: list_a
  defp desc_merge([head_a | tail_a], list_b = [head_b | _]) when head_a >= head_b do
    [head_a | desc_merge(tail_a, list_b)]
  end
  defp desc_merge(list_a = [head_a | _], [head_b | tail_b]) when head_a < head_b do
    [head_b | desc_merge(list_a, tail_b)]
  end
end
