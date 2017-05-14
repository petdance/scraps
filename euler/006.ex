defmodule Euler006 do
  # https://projecteuler.net/problem=6
  # The sum of the squares of the first ten natural numbers is,
  # 1^2 + 2^2 + ... + 10^2 = 385
  #
  # The square of the sum of the first ten natural numbers is,
  # (1 + 2 + ... + 10)^2 = 55^2 = 3025
  #
  # Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
  #
  # Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

  def diff( n ) do
    square_of_sums( n ) - sum_of_squares( n )
  end

  def sum_of_squares( n ) do
    1..n
      |> Enum.map( &square/1 )
      |> Enum.sum
  end

  def square_of_sums( n ) do
    square( 1..n |> Enum.sum )
  end

  defp square(x), do: x * x

end
