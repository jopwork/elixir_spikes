defmodule ElixirSpikesTest do
  use ExUnit.Case
  doctest ElixirSpikes

  test "greets the world" do
    assert ElixirSpikes.hello() == :world
  end

  test "another test case" do
    IO.puts "Another Test Case"
    assert 1 = 1
  end
end
