defmodule MyList do
  def max([]), do: nil
  def max([a]), do: a
  def max([a, b | rem]) when a >= b, do: find_max(rem, a)
  def max([a, b | rem]) when a < b, do: find_max(rem, b)

  defp find_max([], max), do: max
  defp find_max([head | rem], max) when head >= max, do: find_max(rem, head)
  defp find_max([head | rem], max) when head < max, do: find_max(rem, max)

  def min([]), do: nil
  def min([a]), do: a
  def min([a, b | rem]) when a <= b, do: find_min(rem, a)
  def min([a, b | rem]) when a > b, do: find_min(rem, b)

  defp find_min([], min), do: min
  defp find_min([head | rem], min) when head <= min, do: find_min(rem, head)
  defp find_min([head | rem], min) when head > min, do: find_min(rem, min)
end
