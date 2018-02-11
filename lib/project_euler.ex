defmodule ProjectEuler do
  @doc """
  Stream of fibonacci numbers
  """
  def fib_stream do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end

  @doc """
  Returns true if n is prime, i.e. 1 is the only factor
  """
  def is_prime(num), do: factors(num) == [1]

  @doc """
  Stream of prime numbers
  """
  def prime_stream do
    # take the first 3 primes and concat with the calculated primes
    1..3
    |> Stream.concat(
      Stream.iterate(5, &(&1 + 2))
      |> Stream.filter(&is_prime/1)
    )
  end

  @doc """
  Generate sorted list of prime factors
  """
  def factors(num), do: factors(num, div(num, 2))
  defp factors(1, _candidate), do: [1]
  defp factors(_num, 1), do: [1]
  defp factors(num, candidate) when rem(num, candidate) == 0, do: [candidate | factors(num, candidate - 1)]
  defp factors(num, candidate), do: factors(num, candidate - 1)

  @doc """
  List of prime factors to n
  """
  def prime_factors(num), do: factors(num) |> Enum.filter(&is_prime/1)
end