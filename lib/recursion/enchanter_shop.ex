defmodule EnchanterShop do
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
    Check clause to stop the recursive action
  """
  def enchant_for_sale([]), do: []

  @doc """
    Clause to grab an item that is already magic, and add it as the list head
    without performing any transformations. Then make the recursive call in the
    tail with remaining items in list
  """
  def enchant_for_sale([item = %{magic: true} | incoming_items]) do
    [item | enchant_for_sale(incoming_items)]
  end

  @doc """
    Pattern match to grab the first list item, perform the transformations and
    bind to a variable. That variable becomes the head of a new list that
    recursively calls in the tail with the original list's tail - appending
    the resulting list head each iteration until the check clause is hit
  """
  def enchant_for_sale([item | incoming_items]) do
    new_item = %{
      title: "#{@enchanter_name}'s #{item.title}",
      price: item.price * 3,
      magic: true
    }
    [new_item | enchant_for_sale(incoming_items)]
  end
end
