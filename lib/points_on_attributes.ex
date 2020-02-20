defmodule PointsOnAttributes do
  @moduledoc """
    Working with RPG characters. Strength attributes cost 2 points each, and
    both dexterity and intelligence attributes are 3 points each
  """
  def calculate(%{strength: str, dexterity: dext, intelligence: intell}) do
    total_points = (str * 2) + (dext * 3) + (intell * 3)

    IO.puts("You've spent #{total_points} points on character attributes.")
  end
end
