defmodule Euler007 do
  # https://projecteuler.net/problem=7

  # By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  #
  # What is the 10,001st prime number?

  def nth_prime( n ) do
  end

  def is_prime?( n ) do
    Stream.iterate(2, &(&1 + 1))
  end

end
