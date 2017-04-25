defmodule Fib do
    def fib(n) when n==1 or n==2 do
        1
    end

    def fib(n) when n > 0 do
        fib(n-1) + fib(n-2)
    end
end
