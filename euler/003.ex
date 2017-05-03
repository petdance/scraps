defmodule Euler003 do

# http://projecteuler.net/index.php?section=problems&id=3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

  def largest_prime_factor( n ) do
    factors = prime_factors( n )
    [largest|_] = factors

    IO.write 'Prime factors are '
    IO.inspect factors
    IO.write 'Largest prime factor is '
    IO.inspect largest
  end

  def prime_factors( n ) do
    factor_down( [n], 2 )
  end

  defp factor_down( [1 | factors], _ ) do
    factors
  end

  defp factor_down( [n | factors], potential_factor ) do
    if rem(n,potential_factor) == 0 do
      n = div(n,potential_factor)
      factor_down( [n, potential_factor | factors], potential_factor )
    else
      factor_down( [n | factors], potential_factor+1 )
    end
  end

end
