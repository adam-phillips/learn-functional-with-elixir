defmodule TailOptSum do
  def of(n), do: up_to(n, 0)
  defp up_to(0, acc), do: acc
  defp up_to(n, acc) when n > 0, do: up_to(n - 1, n + acc)
end
