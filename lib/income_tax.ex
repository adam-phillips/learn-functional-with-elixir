defmodule IncomeTax do
  def tax(income) when income <= 2000, do: 0
  def tax(income) when income <= 3000, do: income * 0.05
  def tax(income) when income <= 6000, do: income * 0.10
  def tax(income), do: income * 0.15
end
