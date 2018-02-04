defmodule ElixirPatternTests do
  use ExUnit.Case

  test "simple pattern matching" do
    {x, y, z} = {:hello, "world", 42}
    assert x == :hello
    assert y == "world"
    assert z == 42
  end

  test "raise MatchError if the tuples are not of the same size " do
    assert_raise MatchError, fn ->
      {_a, _b, _c} = {:hello, "world"}
    end
  end
end