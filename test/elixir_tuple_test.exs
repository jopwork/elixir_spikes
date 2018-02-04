defmodule ElixirTupleTests do
  use ExUnit.Case

  test "tuple element" do
    assert :ok = elem({:ok, "abc"}, 0)
    assert "abc" = elem({:ok, "abc"}, 1)
    assert_raise ArgumentError, fn -> elem({:ok, "abc"}, 2) end
  end

  test "tuple size" do
    assert 2 == tuple_size({:ok, "hello"})
  end

  test "put element to tuple" do
    tuple = {:ok, "hello"}
    assert {:ok, "world"} == put_elem(tuple, 1, "world")
  end
end