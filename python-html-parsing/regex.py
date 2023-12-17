#!/usr/bin/env python3

import re

imgfinder = re.compile(r'<img src="(.+)"')

with open("sample.html") as f:
    for line in f:
        match = imgfinder.search(line)
        if match:
            print(match.group(1))
