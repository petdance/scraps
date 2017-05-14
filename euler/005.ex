defmodule Euler005 do
  # https://projecteuler.net/problem=5
  # 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  # What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


  def is_divisible_up_to( n, upto ) do
    1..upto
      |> Enum.map( fn(x) -> is_divisible?(n,x) end )
      |> Enum.reduce( &(&1 and &2) )
  end

  def is_divisible?( n, div ), do: rem(n,div) == 0

end
