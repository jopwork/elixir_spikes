defmodule ProjectEuler do
  @doc """
  Stream of fibonacci numbers
  """
  def fib_stream do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end

  @doc """
  Returns true if n is prime
  """
  def is_prime(n), do: factors(n) == [1]

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
  def factors(n), do: factors(n, div(n, 2))
  defp factors(1, _), do: [1]
  defp factors(_, 1), do: [1]
  defp factors(n, i) when rem(n, i) == 0, do: [i | factors(n, i - 1)]
  defp factors(n, i), do: factors(n, i - 1)

  @doc """
  List of prime factors to n
  """
  def prime_factors(n), do: factors(n) |> Enum.filter(&is_prime/1)
end