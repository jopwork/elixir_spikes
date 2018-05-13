defmodule FileTest do
  use ExUnit.Case

  test "exists?" do
    assert !File.exists?("non_existent_file")
    assert File.exists?("test/elixir_file_test.exs")
  end
end
