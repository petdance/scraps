# Working through Chapter 7 of Programming Elixir
defmodule Sum do

  def sum( list ), do: _sum( list )

  defp _sum( [] ), do: 0

  defp _sum( [head|tail] ), do: head + _sum( tail )


  def mapsum( list, func ) do
    _mapsum( list, func )
  end

  defp _mapsum( [], _func ) do
    0
  end

  defp _mapsum( [head|tail], func ) do
    func.(head) + _mapsum( tail, func)
  end


  def max( list ) do
    _max( list )
  end

  defp _max( [n] ), do: n

  defp _max( [head|tail] ) do
    Kernel.max( head, _max( tail ) )
  end


  def caesar( list, n ) do
    _caesar( list, n )
  end

  defp _caesar( [], _ ), do: []

  defp _caesar( [head|tail], n ) do
    [ _rot(head,n) | _caesar( tail, n ) ]
  end

  defp _rot( c, n ) when c+n <= ?z, do: c+n
  defp _rot( c, n ), do: c-n


  def span( from, to ) do
    _span( from, to )
  end

  defp _span( from, to ) when from == to do
    [from]
  end

  defp _span( from, to ) do
    [from | _span( from+1, to ) ]
  end

end
