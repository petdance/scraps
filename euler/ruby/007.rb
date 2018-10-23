#!/usr/bin/ruby

=begin rdoc

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
can see that the 6th prime is 13.

What is the 10,001st prime number?

=end

def is_prime(n)
    max_factor = Math.sqrt(n).to_i
    2.upto(max_factor) { |test_factor|
        return false if n % test_factor == 0
    }

    return true
end

i = 3
nth = 1
while nth < 10001
    while !is_prime(i)
        i += 2
    end
    nth += 1
    printf "%d: %d\n", nth, i
    i += 2
end
