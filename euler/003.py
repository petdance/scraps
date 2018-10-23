# https://projecteuler.net/problem=3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

from math import sqrt

def factors_of( n ):
    for i in range( 2, int(sqrt(n))+1 ):
        if ( n % i == 0 ):
            return [ i ] + factors_of(n/i)
    return [ n ]

factors = factors_of( 600851475143 )
print factors
print max(factors)
