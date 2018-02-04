defmodule ElixirSpikes do
  @moduledoc """
  Documentation for ElixirSpikes.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirSpikes.hello
      {:world, "Hello world from Elixir!"}

  """
  def hello do
    {:world, IO.puts "Hello world from Elixir!"}
  end
end
