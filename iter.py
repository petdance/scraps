


class Ints:
    def __init__(self, start, end):
        self.end = end
        self.n = start

    def __iter__(self):
        return self

    def __next__(self):
        self.n += 1
        if self.n > self.end:
            raise StopIteration()

        return self.n


if __name__ == '__main__':
    for i in Ints(5, 10):
        print(i)
