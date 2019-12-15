


class EveryOther:
    def __init__(self, filename):
        self.f = open(filename, 'rt')
        self.n = 0

    def __iter__(self):
        return self

    def __next__(self):
        line = self.f.readline()
        self.n += 1
        if line == '':
            raise StopIteration

        line = self.f.readline()
        self.n += 1
        if line == '':
            raise StopIteration

        return line.rstrip('\n'), self.n


if __name__ == '__main__':
    for line, n in EveryOther('/Users/andy/ack4/t/text/ozymandias.txt'):
        print(n, line)
        #print(str(n) + ': ' + line)
