defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  @doc """
    Pattern match first map in the list using :magic key, and when it matches
    the boolean filter passed we keep it and recursively call with the tail of
    the list. If the list is still populated and the :magic value doesn't
    match the filter, we ignore the head and recursively call with the tail
  """
  def filter_items([], magic: _magic_filter), do: []
  def filter_items([item = %{magic: magic} | rest], magic: magic_filter) when magic == magic_filter do
    [item | filter_items(rest, magic: magic_filter)]
  end
  def filter_items([_item | rest], magic: magic_filter) do
    filter_items(rest, magic: magic_filter)
  end
end
