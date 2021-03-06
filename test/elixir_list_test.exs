defmodule ElixirListTests do
  use ExUnit.Case

  test "list operations" do
    assert 6 == length([1, 2, 3, 4, 5, 6])
    assert [1, 2, 3] == [1, 2] ++ [3]
    assert [1, 3, 5] == [1, 2, 3, 4, 5, 6] -- [2, 4, 6]
  end

  test "head and tail" do
    list = [1, 2, 3]
    assert 1 == hd(list)
    assert [2, 3] == tl(list)
  end

  test "head of empty list" do
    assert_raise ArgumentError, fn -> hd([]) end
  end

  test "insert onto head" do
    list = [1, 2, 3]
    newval = 0
    newlist = [newval | list]
    assert newlist == [0, 1, 2, 3]

    assert [list] == [[1, 2, 3]]
  end
end
