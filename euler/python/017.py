#!/usr/bin/env python3


def getwords(n):
    words = {
        1: "one",
        2: "two",
        3: "three",
        4: "four",
        5: "five",
        6: "six",
        7: "seven",
        8: "eight",
        9: "nine",
        10: "ten",
        11: "eleven",
        12: "twelve",
        13: "thirteen",
        14: "fourteen",
        15: "fifteen",
        16: "sixteen",
        17: "seventeen",
        18: "eighteen",
        19: "nineteen",
        20: "twenty",
        30: "thirty",
        40: "forty",
        50: "fifty",
        60: "sixty",
        70: "seventy",
        80: "eighty",
        90: "ninety",
    }

    if n == 1000:
        return "one thousand"

    if n < 100:
        if n <= 20:
            return words[n]

        if n % 10 == 0:
            return words[n]

        return getwords(n//10*10) + "-" + getwords(n%10)

    hundreds = n//100
    s = getwords(hundreds) + ' hundred'

    remainder = n % 100
    if remainder > 0:
        s = s + ' and ' + getwords(remainder)

    return s

print(10, getwords(10))
print(19, getwords(19))
print(42, getwords(42))
print(242, getwords(242))
print(319, getwords(319))
print(500, getwords(500))
print(999, getwords(999))
print(1000, getwords(1000))
