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

  test "is_prime?" do
    assert is_prime?(1)
    assert is_prime?(2)
    assert is_prime?(3)
    refute is_prime?(4)
    assert is_prime?(5)
    refute is_prime?(6)
  end

  test "prime_stream" do
    primes =
      prime_stream()
      |> Enum.take(10)

    assert primes == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  test "prime_factors" do
    assert prime_factors(1) == []
    assert prime_factors(2) == [2]
    assert prime_factors(3) == [3]
    assert prime_factors(4) == [2, 2]
    assert prime_factors(10) == [5, 2]
    assert prime_factors(101) == [101]
    assert prime_factors(13195) == [29, 13, 7, 5]
  end

  test "is_palindrome?" do
    assert is_palindrome?("a")
    assert is_palindrome?("aba")
    assert is_palindrome?("abba")
    refute is_palindrome?("ab")
  end

  test "lcm" do
    assert lcm(1..10) == 2520
  end
end
