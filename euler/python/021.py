#!/usr/bin/env python3

from math import sqrt


def divisors(n):
    divisors = [1]
    for i in range(2, int(sqrt(n)) + 1):
        if n % i == 0:
            divisors.append(i)
            other = int(n / i)
            if other != i and i != n:
                divisors.append(other)

    return divisors


def d(n):
    return sum(divisors(n))


print(divisors(73))
print(divisors(63))
print(divisors(64))


print(d(220))
print(d(284))
