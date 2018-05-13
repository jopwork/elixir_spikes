defmodule ElixirSpikesTest do
  use ExUnit.Case
  # doctest ElixirSpikes

  test "greets the world" do
    {result, message} = ElixirSpikes.hello()
    assert result == :world
    assert message == "Hello world from Elixir!"
  end

  test "arrays.new" do
    a = Arrays.new()
    assert 0 == Arrays.size(a)

    list = for n <- 1..5, do: n
    b = Arrays.new(list)
    assert 5 = Arrays.size(b)
    # zero-based index
    assert 1 = Arrays.get(b, 0)
    assert 2 = Arrays.get(b, 1)
  end
end
