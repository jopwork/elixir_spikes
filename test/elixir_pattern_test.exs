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

  test "raise MatchError when matching tuples to lists" do
    ## can't run this code -- compile error on pattern matching
    # assert_raise MatchError, fn ->
    #   {_a, _b, _c} = [:hello, "world", 42]
    # end
  end

  test "match head and tail" do
    [head | tail] = [1, 2, 3, 4, 5]
    assert head == 1
    assert tail == [2, 3, 4, 5]
  end

  test "match new values" do
    [x, y] = [1, 2]
    assert x == 1
    [x, y] = [2, 2]
    assert x == 2
  end

  test "pinning values" do
    x = 1

    assert_raise MatchError, fn ->
      # same as 1 = 3
      ^x = 3
    end
  end

  test "underscore to ignore pattern" do
    # ignore tail
    [head | _] = [1, 2, 3]
    assert head == 1

    [_ | tail] = [1, 2, 3]
    assert tail == [2, 3]
  end

  test "swapping values" do
    [x, y] = [1, 2]
    assert x == 1
    assert y == 2

    [x, y] = [y, x]
    assert x == 2
    assert y == 1
  end

  test "tuple with list" do
    {first, second, third} = {1, 2, []}
    {first, second, third} = {1, 2, [3, 4]}
  end
end
