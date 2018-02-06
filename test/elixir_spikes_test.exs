defmodule ElixirSpikesTest do
  use ExUnit.Case
  # doctest ElixirSpikes

  test "greets the world" do
    {result, message} = ElixirSpikes.hello()
    assert result == :world
    assert message == "Hello world from Elixir!"
  end
end
