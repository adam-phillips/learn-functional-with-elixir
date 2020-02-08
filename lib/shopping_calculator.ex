defmodule ShoppingCalculator do
  @doc """
    Calculate the total amount spent for a shopping cart. Function expects
    a list of maps at least with keys :quantity and :cost to calculate
  """
  def cart_total(cart) do
    cart
    |> Enum.map(& &1[:quantity] * &1[:cost])
    |> Enum.sum()
    |> print_result()
  end

  def apply_tax(retail_price), do:
    IO.puts("Price: $#{retail_price * 1.12} - Tax: $#{retail_price * 0.12}")

  @doc """
    Accept a list of prices, then enumerate the list and call apply_tax/1
    to calculate and print the price including tax and the tax amount
  """
  def price_and_tax(retail_prices), do: Enum.each(retail_prices, &apply_tax(&1))

  defp print_result(total), do: IO.puts("Total amount spent: $#{total}")
end
