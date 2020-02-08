defmodule MatchstickFactory do
  @big_box 50
  @medium_box 20
  @small_box 5

  def boxes(matchsticks) do
    big_boxes = div(matchsticks, @big_box)
    remaining = rem(matchsticks, @big_box)

    medium_boxes = div(remaining, @medium_box)
    remaining = rem(remaining, @medium_box)

    small_boxes = div(remaining, @small_box)
    remaining = rem(remaining, @small_box)

    %{
      big: big_boxes,
      medium: medium_boxes,
      small: small_boxes,
      remaining_matchsticks: remaining
    }
  end
end
