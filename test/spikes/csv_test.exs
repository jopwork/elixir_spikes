defmodule CsvTests do
  use ExUnit.Case

  test "read_csv" do
    filename = "test/spikes/MTXXX.csv"
    assert File.exists?(filename)

    File.stream!(filename)
    |> IO.inspect()
    |> CSV.decode()
    |> Stream.take(1)
    |> Enum.to_list()
    |> IO.inspect()
  end
end
