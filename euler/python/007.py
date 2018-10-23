# https://projecteuler.net/problem=7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

from math import sqrt

def is_prime(n):
    for i in range( 2, int(sqrt(n))+1 ):
        if n % i == 0:
            return False
    return True

nfound = 1  # We start with 2

maybe = 3
while nfound < 10001:
    if is_prime(maybe):
        nfound += 1
        print maybe
    maybe += 2
