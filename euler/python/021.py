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


d = dict()
for i in range(1,10000):
    d[i] = sum(divisors(i))

amicable = []
for i in range(1,10000):
    s = d[i]
    if (s in d) and (d[s] == i) and (s != i):
        # Only add one, because its partner will come along soon.
        amicable.append(i)

print(amicable)
print(sum(amicable))
