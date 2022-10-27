#!/usr/bin/env python3

from sympy import *
from sympy.plotting import plot3d

x,y = symbols('x y')
f = 2 * x + 3 * y
print(x)
print(y)
print(f)
plot3d(f)


