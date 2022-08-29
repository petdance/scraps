#!/usr/bin/env python3


def factorial(n):
    if n == 1:
        return 1

    return n * factorial(n - 1)


n = factorial(100)
s = f"{n}"

print(sum([int(x) for x in s]))
