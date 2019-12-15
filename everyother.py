


class EveryOther:
    def __init__(self, filename):
        self.f = open(filename, 'rt')

    def __iter__(self):
        return self

    def __next__(self):
        line = self.f.readline()
        if line == '':
            raise StopIteration

        line = self.f.readline()
        if line == '':
            raise StopIteration

        return line.rstrip('\n')


if __name__ == '__main__':
    for line in EveryOther('/Users/andy/ack4/t/text/ozymandias.txt'):
        print(line)
