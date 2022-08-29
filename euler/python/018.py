#!/usr/bin/env python3


TRIANGLE = '''
3
7 4
2 4 6
8 5 9 3
'''

def get_rows(triangle):
    """Breaks the triangle into an array of arrays of numbers"""
    return [list(map(int,s.split(' '))) for s in triangle.splitlines() if s != ""]

def best_path_starting_at(rows, row, col):
    nextrow = row + 1
    if nextrow >= len(rows):
        return [rows[row][col]]

    left = best_path_starting_at(rows, nextrow, col)
    right = best_path_starting_at(rows, nextrow, col+1)

    if sum(left) > sum(right):
        best = left
    else:
        best = right

    best.insert(0, rows[row][col])
    return best


rows = get_rows(TRIANGLE)
best = best_path_starting_at(rows, 0, 0)
print(sum(best))
