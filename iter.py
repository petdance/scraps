import sys
import pstats
import cProfile

class LineIter:
    def __init__(self, filename):
        self.f = open(filename, 'rt')
    def __iter__(self):
        return self

    def __next__(self):
        line = self.f.readline()
        if line == '':
            raise StopIteration

        line = line.upper()

        return line

def doit():
    filename = sys.argv[1]
    for line in LineIter(filename):
        pass

if __name__ == '__main__':
    cProfile.run('doit()', 'fooprof')
    p = pstats.Stats('fooprof')
    p.strip_dirs().sort_stats('time').print_stats(10)
