defmodule ElixirSpikesTest do
  use ExUnit.Case
  #doctest ElixirSpikes

  test "greets the world" do
    { result, message } = ElixirSpikes.hello()
    assert result == :world
    IO.puts message
  end
end
