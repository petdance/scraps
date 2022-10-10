#!/usr/bin/env python3

import os

for root, dirs, files in os.walk("/Users/andy/cpython"):
    for filename in files:
        if filename.endswith("py"):
            print(root + '/' + filename)
