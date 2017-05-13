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

end
