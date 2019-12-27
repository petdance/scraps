

import timeit
import re

rgx = re.compile('foo')
s = 'Now is the time for all good men to come to the aid of their football'

x = timeit.timeit(
    'rgx.search(s)',
    setup='import re; rgx = re.compile("foo\w+"); s = " Now is the time for all good men to come to the aid of their football"',
    number=10000000,
)

print(x)
