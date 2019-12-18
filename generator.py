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

if __name__ == '__main__':
    for line in LineIter('wc.hs'):
        print(line)
