defmodule ElixirLangTests do
  use ExUnit.Case
  #doctest ElixirSpikes

  test "addition and equality" do
    assert 3 == 1+2
  end

  test "division operator returns float" do
    assert 3 == 6 / 2
    assert 3.0 === 6 / 2
  end

  test "div returns integer" do
      assert 3 == div(6,2)
      assert 3 === div(6,2)
  end
end
