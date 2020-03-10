defmodule Quicksort do
  @moduledoc """
    Module for implementing a quicksort solution using higher order functions,
    namely Enum.split_with/2
  """

  @doc """
    A quicksort uses a divide and conquer approach using a "pivot", at which
    the enumerable is split in two sub-lists which are then operated on to
    sort. In this case, an empty list serves as a catch, with the second
    sort/1 function being called when the list is populated.

    The list is first split into a head and tail, then a tuple consisting of
    the variables `lesser` and `greater` are pattern matched to the results
    of Enum.split_with/2, which accepts a list (`tail`) as its first argument,
    and a function as its second.

    Enum.split_with/2 returns 2 lists - one containing values that produce a
    truthy result when applied to the function, and a second list of values
    that produce a falsey result. Here, the head of the list (`pivot`) is what
    each remaining value in the list is compared to. If the value is less than
    the pivot, it's included in the list bound to the tuple variable `lesser`.
    Otherwise, it's included in the list bound to `greater`. The lists are then
    concatenated in the order `smaller` -> `pivot` -> `greater` as  sort/1
    continues to be called for both the `lesser` and `greater` lists,
    each time with the list head serving as the pivot value

    As the `pivot` is picked off for comparison in each iteration, it will
    ultimately fall in line where it "belongs" in the sort. In operation, this
    looks like after supplying and shuffling a range of integers:

    iex> list = Enum.shuffle(1..20)
    [5, 9, 4, 18, 8, 1, 7, 20, 11, 14, 16, 19, 6, 3, 10, 17, 12, 13, 15, 2]

    When sort/1 is called, first the pivot value is 5 as it's the list head.
    Each value in the tail is evaluated against 5 to see if it's less than
    or equal. If so, it is added to the list bound to the tuple variable
    `lesser` since it resulted in a truthy value. The larger numbers result
    in a falsey value, so they are appended to the list bound to `greater`

    After the first pass, the lists looks like this (lesser ++ pivot ++ greater)
    [4, 1, 3, 2] ++ 5 ++ [9, 18, 8, 7, 20, 11, 14, 16, 19, 6, 10, 17, 12, 13, 15]
    sort/1 is continually called on both the `lesser` and `greater` lists
    until sorting is complete.

    iex> Quicksort.sort(list)
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

    This can easily be converted to an ascending sort by simply flipping the
    function supplied to Enum.split_with/2 to use >=
  """
  def sort([]), do: []
  def sort([pivot | tail]) do
    {lesser, greater} = Enum.split_with(tail, &(&1 <= pivot))
    sort(lesser) ++ [pivot] ++ sort(greater)
  end
end
