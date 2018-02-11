defmodule ProjectEulerTests do
  use ExUnit.Case
  import ProjectEuler

  @moduledoc """
  Test the Project Euler module
  """

  test "fib_stream" do
    fibs = fib_stream() |> Enum.take(10)
    assert fibs == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
  end

  test "is_prime" do
    assert is_prime(1)
    assert is_prime(2)
    assert is_prime(3)
    refute is_prime(4)
    assert is_prime(5)
    refute is_prime(6)
  end

  test "stream of primes" do
    primes =
      prime_stream()
      |> Enum.take(10)

    assert primes == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  test "prime factors" do
    # assert prime_factors(10) = [1,2,5]

    assert factors(1) == [1]
    assert factors(2) == [1]
    assert factors(3) == [1]
    assert factors(4) == [2, 1]
  end
end