defmodule WordBuilder do
  @doc """
    Take two args, with importance on order. String.at is single arity, so we
    capture an instance of the function using a closure so it's lazily called
    and finally joins the letters into a new word based on the positions list
  """
  def build(alphabet, positions) do
    letters = Enum.map(positions, &(String.at(alphabet, &1)))
    Enum.join(letters)
  end
end
