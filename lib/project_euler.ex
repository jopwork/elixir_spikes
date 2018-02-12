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
  def is_prime(num) when num >= 0 and num < 3, do: num

  def is_prime(num) do
    2..num
    |> Stream.filter(fn candidate -> rem(num, candidate) == 0 end)
    |> Enum.count() == 1
  end

  @doc """
  Stream of prime numbers
  """
  def prime_stream, do: Stream.iterate(2, &next_prime/1)

  defp next_prime(num), do: _next_prime(num + 1)

  defp _next_prime(candidate) do
    if is_prime(candidate) do
      candidate
    else
      next_prime(candidate)
    end
  end

  @doc """
  Generate sorted list of prime factors
  """
  def factors(num), do: factors(num, div(num, 2))

  defp factors(1, _candidate), do: [1]

  defp factors(_num, 1), do: [1]

  defp factors(num, candidate) when rem(num, candidate) == 0,
    do: [candidate | factors(num, candidate - 1)]

  defp factors(num, candidate), do: factors(num, candidate - 1)

  @doc """
  List the prime factors of num
  """
  def prime_factors(num) do
    _prime_factors({num, 2, []})
  end

  defp _prime_factors({dividend, divisor, result}) do
    cond do
      divisor > dividend ->
        result

      rem(dividend, divisor) == 0 ->
        _prime_factors({div(dividend, divisor), divisor, [divisor | result]})

      true ->
        _prime_factors({dividend, next_prime(divisor), result})
    end
  end
end