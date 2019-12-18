import sys

class LineIter:
    def __init__(self, filename):
        self.f = open(filename, 'rt')

    def __iter__(self):
        for line in self.f:
            yield line.upper()

if __name__ == '__main__':
    filename = sys.argv[1]
    for line in LineIter(filename):
        print(line, end='')
