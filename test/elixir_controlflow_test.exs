defmodule ElixirControlFlowTests do
  use ExUnit.Case

  test "case statement" do
    x = 2

    # case can be matched to  value
    y =
      case x do
        1 -> :one
        2 -> :two
        3 -> :three
      end

    assert y == :two
  end

  test "case pattern match" do
    x =
      case {4, 5, 6} do
        {1, 2, 3} -> :unodostres
        {4, x, 6} -> x * x
      end

    assert x == 25
  end

  test "case else" do
    x =
      case 42 do
        0 -> :non
        1 -> :one
        _ -> :many
      end

    assert x == :many
  end

  test "no matching case results in error" do
    assert_raise CaseClauseError, fn ->
      case 1 do
        2 -> :not_one
      end
    end
  end
end