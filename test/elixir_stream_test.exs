defmodule ElixirStreamTests do
  use ExUnit.Case

  test "chunk_every" do
    Stream.chunk_every(1..10, 5, 1) |> Enum.to_list |> IO.inspect
  end

  test "iterate" do
    Stream.iterate(1, & &1+1) |> Enum.take(10) |> IO.inspect
  end
end