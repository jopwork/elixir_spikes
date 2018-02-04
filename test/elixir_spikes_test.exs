defmodule ElixirSpikesTest do
  use ExUnit.Case
  doctest ElixirSpikes

  test "greets the world" do
    assert ElixirSpikes.hello() == :world
  end
end
