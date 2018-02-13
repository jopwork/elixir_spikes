defmodule ProblemSet01Tests do
  use ExUnit.Case
  require Integer
  import ProjectEuler

  @moduledoc """
  Project Euler Tests
  """

  @doc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, 
  we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000. 
  """
  test "Problem 1: Multiple of 3 and 5: " do
    mult? = fn n -> rem(n, 3) == 0 or rem(n, 5) == 0 end

    1..999
    |> Enum.filter(mult?)
    |> Enum.sum()
    |> IO.inspect(label: "Problem 1")
  end

  @doc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
  By starting with 1 and 2, the first 10 terms will be:

      1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values do not exceed 
  four million, find the sum of the even-valued terms.
  """
  test "Problem 2: Even Fibonacci numbers: " do
    fib_stream = ProjectEuler.fib_stream()

    fib_stream
    |> Stream.filter(&Integer.is_even/1)
    |> Enum.take_while(&(&1 < 4_000_000))
    |> Enum.sum()
    |> IO.inspect(label: "Problem 2")
  end

  @doc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
  """
  test "Problem 3: Largest prime factor:" do
    num = 600_851_475_143

    result = prime_factors(num)

    IO.inspect(result, label: "Problem 3")
    assert result |> Enum.reduce(1, &*/2) == num
  end

  @doc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """
  test "Problem 4: Largest palindrome produce" do
    for(
      x <- 999..1,
      y <- 999..1,
      do: x * y
    )
    |> Enum.filter(&is_palindrome?(Integer.to_string(&1)))
    |> Enum.max()
    |> IO.inspect(label: "Problem 4")
  end

  @doc """
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  """
  test "Problem 5: smallest multiple" do
    splitter = fn pf -> Enum.chunk_by(pf, fn x -> x end) end

    frequency_counter = fn
      [] -> [value: 1, freq: 0]
      [head | tail] -> [value: head, freq: length(tail) + 1]
    end

    # product of all prime_factors^maxfreq
    1..20
    |> Enum.map(&prime_factors/1)
    |> IO.inspect(label: "Prime Factors")
    |> Enum.map(splitter)
    |> IO.inspect(label: "Chunks")
    |> Enum.map(&Enum.map(&1, frequency_counter))
    |> IO.inspect(label: "Frequency Count")
    |> Enum.flat_map(& &1)
    |> IO.inspect(label: "Flattened Frequency Count")
    |> Enum.sort(&(&1[:value] < &2[:value]))
    |> Enum.chunk_by(& &1[:value])
    |> IO.inspect(label: "Chunked by Frequency Count")
    |> Enum.map(&Enum.max(&1, fn x -> x[:freq] end))
    |> IO.inspect(label: "Sorted Frequency Count")
    |> Enum.map(fn [value: v, freq: f] -> :math.pow(v, f) end)
    |> IO.inspect(label: "Powers")
    |> Enum.reduce(&(&1 * &2))
    |> IO.inspect(label: "Problem 5")
  end
end