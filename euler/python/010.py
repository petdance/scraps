# https://projecteuler.net/problem=10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

from math import sqrt

def is_prime(n):
    for i in range( 2, int(sqrt(n))+1 ):
        if n % i == 0:
            return False
    return True

potential_factors = [ 2 ] + range(3,2000000,2)
primes = [ i for i in potential_factors if is_prime(i) ]
print primes
print sum(primes)
