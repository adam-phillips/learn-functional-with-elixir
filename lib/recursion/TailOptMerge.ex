defmodule TailOptMerge do
  def merge_sort([]), do: []
  def merge_sort([a]), do: [a]
  def merge_sort(list) do
    half_size =
      Enum.count(list)
      |> div(2)
    {list_a, list_b} = Enum.split(list, half_size)
      list_a = merge_sort(list_a)
      list_b = merge_sort(list_b)
      merge(list_a, list_b, [])
  end

  defp merge([], [], acc), do: Enum.reverse(acc)
  defp merge([], [head_b | tail_b] = list_b, acc), do: merge([], tail_b, [head_b | acc])
  defp merge([head_a | tail_a] = list_a, [], acc), do: merge(tail_a, [], [head_a | acc])

  defp merge([head_a | tail_a], [head_b | _tail_b] = list_b, acc) when head_a <= head_b do
    merge(tail_a, list_b, [head_a | acc])
  end

  defp merge([head_a | _tail_a] = list_a, [head_b | tail_b], acc) when head_a > head_b do
    merge(list_a, tail_b, [head_b | acc])
  end
end
