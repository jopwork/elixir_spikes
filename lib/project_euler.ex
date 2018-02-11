defmodule ProjectEuler do
  def fib_stream do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end

  def is_prime(n) when n <= 3 and n > 0, do: n

  def is_prime(n) do
    2..n
    |> Enum.filter(fn a -> rem(n, a) == 0 end)
    |> Enum.count() == 1
  end

  def prime_stream do
    # we now these are primes
    1..3
    |> Stream.concat(
      Stream.iterate(5, &(&1 + 2))
      |> Stream.filter(&is_prime/1)
    )
  end
end