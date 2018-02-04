defmodule ElixirTupleTests do
  use ExUnit.Case

  test "tuple element" do
    assert :ok = elem({:ok, "abc"}, 0)
    assert "abc" = elem({:ok, "abc"}, 1)
    assert_raise ArgumentError, fn -> elem({:ok, "abc"}, 2) end
  end
end