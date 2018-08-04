defmodule CsvTests do
  use ExUnit.Case

  test "read_csv" do
    filename = "test/spikes/MTXXX.csv"
    assert File.exists?(filename)

    File.stream!(filename)
    |> CSV.decode()
    |> Enum.to_list()
    |> IO.inspect()
  end

  test "file does not exist" do
    {:error, :enoent} = read_csv_file("unknownfile.xxx")
  end

  test "file exists" do
    {:ok, rows} = read_csv_file("test/spikes/MTXXX.csv")

    rows
    |> Enum.map(fn {:ok, fields} -> fields end)
    |> Enum.map(&List.last/1)
    |> IO.inspect()
  end

  "Read a csv file"
  def read_csv_file(filename) do
    try do
      rows =
        File.stream!(filename)
        |> CSV.decode()
        |> Enum.to_list()

      {:ok, rows}
    rescue
      e -> {:error, e.reason}
    end
  end
end
