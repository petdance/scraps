import sys
import pstats
import cProfile

class LineIter:
    def __init__(self, filename):
        self.f = open(filename, 'rt')

    def __iter__(self):
        for line in self.f:
            yield line.upper()

def doit():
    filename = sys.argv[1]
    for line in LineIter(filename):
        pass

if __name__ == '__main__':
    cProfile.run('doit()', 'fooprof')
    p = pstats.Stats('fooprof')
    p.strip_dirs().sort_stats('time').print_stats(10)
