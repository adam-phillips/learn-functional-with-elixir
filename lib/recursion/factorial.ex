defmodule Factorial do
  @moduledoc """
    Module to demo the approach to recursion known as "Decrease and Conquer".
    This reduces a problem to its simplest form and starts solving it
    incrementally
  """

  @doc """
    These basic functions expects a number between 0 - 4 and manually calculate
    the factorial. Negative numbers or numbers greater than 4 raise an error
  """
  def of(0), do: 1
  def of(1), do: 1
  def of(2), do: 2 * 1
  def of(3), do: 3 * 2 * 1
  def of(4), do: 4 * 3 * 2 * 1

  @doc """
    These functions go a step further, recursively calling the preceding
    function
  """
  def iter_1(0), do: 1
  def iter_1(1), do: 1 * iter_1(0)
  def iter_1(2), do: 2 * iter_1(1)
  def iter_1(3), do: 3 * iter_1(2)
  def iter_1(4), do: 4 * iter_1(3)

  @doc """
    These functions are the final iteration on the problem. The check clause
    stops recursion when the arg is 0, and the main function takes any number,
    recursively building a list of multiplication of that number and each less
    by 1 until reaching 0. Unlike before, we can now use any positive number
  """
  def final_of(0), do: 1
  def final_of(n) when n > 0, do: n * final_of(n - 1)
end
