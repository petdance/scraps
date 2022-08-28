#!/usr/bin/env python3


TRIANGLE = '''
3
7 4
2 4 6
8 5 9 3
'''

def get_rows(triangle):
    """Breaks the triangle into an array of arrays of numbers"""
    return [s.split(' ') for s in triangle.splitlines() if s != ""]

rows = get_rows(TRIANGLE)
print(rows)
