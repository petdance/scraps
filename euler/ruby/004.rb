#!/usr/bin/ruby

=begin rdoc

http://projecteuler.net/index.php?section=problems&id=4

A palindromic number reads the same both ways. The largest palindrome
made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit
numbers.

=end

def is_palindromic(n)
    str = '%d' % n

    return str == str.reverse
end

max = 0
100.upto(999) { |x|
    100.upto(999) { |y|
        n = x*y
        if is_palindromic(n)
            #print "#{x} x #{y} = #{n}\n"
            max = n if n > max
        end
    }
}
print max, "\n"
