defmodule ElixirControlFlowTests do
  use ExUnit.Case

  test "assign case to variable" do
    y =
      case 2 do
        1 -> :one
        2 -> :two
        3 -> :three
      end

    assert y == :two
  end

  test "use tuple in case" do
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

  test "CaseClauseError when no matching case" do
    assert_raise CaseClauseError, fn ->
      case 1 do
        2 -> :not_one
      end
    end
  end

  test "cond control flow" do
    x =
      cond do
        1 + 1 == 3 -> :wrong
        1 + 2 == 3 -> :right
      end

    assert x == :right
  end
end
