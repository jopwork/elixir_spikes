defmodule ElixirLangTests do
  use ExUnit.Case
  # doctest ElixirSpikes

  test "addition and equality" do
    assert 3 == 1 + 2
  end

  test "division operator returns float" do
    assert 3 == 6 / 2
    assert 3.0 === 6 / 2
  end

  test "div returns integer" do
    assert 3 == div(6, 2)
    assert 3 === div(6, 2)
  end

  test "byte_leng and string length" do
    str = "hellö"
    assert 6 == byte_size(str)
    assert 5 == String.length(str)
  end

  test "string upcase" do
    assert "HELLÖ" == String.upcase("hellö")
  end

  test "anonymous functions" do
    add = fn a, b -> a + b end
    assert 3 == add.(1, 2)
    assert is_function(add)
    assert is_function(add, 2)
    refute is_function(add, 1)

    double = fn a -> add.(a, a) end
    assert 4 == double.(2)
  end

  test "closure do not affect outside value" do
    x = 42
    assert 42 == (fn -> x end).()
    assert 0 == (fn -> x = 0 end).()
    assert x == 42
  end
end
