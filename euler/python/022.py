#!/usr/bin/env python3


def nameval(s):
    return sum([ord(i)-64 for i in s])

f = open("022.txt")
line = f.readline()
names = [i.strip('"') for i in line.split(",")]
names.sort()

scores = []
for (pos, name) in enumerate(names):
    scores.append((pos + 1) * nameval(name))
print(sum(scores))
