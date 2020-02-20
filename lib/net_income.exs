defmodule NetIncome do
  def tax(income) when income <= 2000, do: 0
  def tax(income) when income <= 3000, do: income * 0.05
  def tax(income) when income <= 6000, do: income * 0.10
  def tax(income), do: income * 0.15
end

input = IO.gets "Enter your gross salary:\n"


# Take user input for their gross salary and validate proper input type. If
# valid, calculate the tax and display the net salary along with income tax

case Float.parse(input) do
  :error -> IO.puts "Invalid salary entered: #{input}"
  {salary, _} ->
    tax = NetIncome.tax(salary)
    IO.puts "Net salary: $#{salary - tax} | Income Tax: $#{tax}"
end
