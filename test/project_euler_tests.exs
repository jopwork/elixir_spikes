defmodule ProjectEulerTests do
  use ExUnit.Case

  @moduledoc """
  Project Euler Tests
  """

  test "Problem 1: Multiple of 3 and 5" do
    mult? = fn n -> rem(n, 3) == 0 or rem(n, 5) == 0 end
    answer = 
      1..999
      |> Enum.filter(mult?)
      |> Enum.sum()
    IO.puts("Problem 1: #{answer}")
  end
end
