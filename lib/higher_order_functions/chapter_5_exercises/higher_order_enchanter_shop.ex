defmodule HigherOrderEnchanterShop do
  @moduledoc """
    This module builds on the EnchanterShop that was built to implement
    recursion, but provides a solution using higher order functions.
  """
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  @enchanter_name "Edwin"

  @doc """
    Iterate over all items, calling enchant/1 for each one. If the item is
    magical, it will just be returned. If not, it will be "enchanted" to
    include the enchanter's name and the price increased times 3 as a charge
    for the enchantment
  """
  def enchant_for_sale(items) do
    Enum.map(items, &enchant/1)
  end

  defp enchant(item = %{magic: true}), do: item
  defp enchant(item) do
    %{
      title: "#{@enchanter_name}'s #{item.title}",
      price: item.price * 3,
      magic: true
    }
  end
end
