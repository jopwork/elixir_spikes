defmodule FileTest do
  use ExUnit.Case

  test "exists?" do
    assert !File.exists?("non_existent_file")
    assert File.exists?("test/elixir_file_test.exs")
  end

  test "stream non existent file" do
    try do
      File.stream!("non_existent_file")
      |> Enum.take(1)
      |> IO.inspect()
    rescue
      e -> IO.inspect e, label: "Error: "
    end
  end
end
