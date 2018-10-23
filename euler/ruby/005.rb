#!/usr/bin/ruby -w

=begin rdoc

http://projecteuler.net/index.php?section=problems&id=5

2520 is the smallest number that can be divided by each of the
numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by
all of the numbers from 1 to 20?

=end

def divisible_up_to( n, top_divisor )
    2.upto( top_divisor ) { |i|
        if ( n % i != 0 )
            return false
        end
    }
    return true
end

maybe = 420
while !divisible_up_to( maybe, 19 )
    maybe += 420
end
print maybe, "\n"
