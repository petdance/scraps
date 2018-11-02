# https://projecteuler.net/problem=16
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

n = pow(2, 1000)
s = "%s" % n
digits = [ord(i) - ord('0') for i in list(s)]
print(sum(digits))
