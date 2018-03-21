defmodule ElixirComprehensionTests do
  use ExUnit.Case

  test "range" do
    sum = 20

    for c <- sum..3 do
      for b <- (c - 1)..2 do
        a = sum - c - b
        if a > 0 and a < b and b < c, do: IO.puts("Triplets #{a} #{b} #{c}")
      end
    end

    sum = 20

    for a <- 1..sum do
      for b <- 1..sum do
        c = sum - a - b

        if a < b and b < c, do: IO.puts("Triplets #{a} #{b} #{c}")
      end
    end
  end
end
