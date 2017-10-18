defmodule Euler004 do
  # https://projecteuler.net/problem=4
  # A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  # Find the largest palindrome made from the product of two 3-digit numbers.

  def foo() do
    palindromes = for x <- 1..999, y <- 1..999, is_palindromic?( x * y ), do: x*y
    palindromes |> Enum.max
  end


  def is_palindromic?( n ) do
    digits = digits( n )
    digits == Enum.reverse( digits )
  end

  def digits( n ) do
    _digits( [n] )
  end

  defp _digits( [ n | digits ] ) when n > 0 and n < 10 do
    [ n | digits ]
  end

  defp _digits( [ n | digits ] ) when n >= 10 do
    _digits( [ div(n,10), rem(n,10) | digits ] )
  end

end
