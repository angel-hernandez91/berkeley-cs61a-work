#############
# Iterators #
#############

class IteratorRestart:
    """
    >>> i = IteratorRestart(2, 7)
    >>> for item in i:
    ...     print(item)
    2
    3
    4
    5
    6
    7
    >>> for item in i:
    ...     print(item)
    2
    3
    4
    5
    6
    7
    """
    def __init__(self, start, end):
        self.start = start - 1
        self.end = end

    def __next__(self):
        if self.start != self.end:
            self.start += 1
        else:
            self.start = 1
            raise StopIteration
        return self.start

    def __iter__(self):
        return self

##############
# Generators #
##############

def countdown(n):
    """
    >>> for number in countdown(5):
    ...     print(number)
    ...
    5
    4
    3
    2
    1
    0
    """
    while n >= 0:
        yield n
        n -= 1

class Countdown:
    """
    >>> for number in Countdown(5):
    ...     print(number)
    ...
    5
    4
    3
    2
    1
    0
    """
    def __init__(self, n):
        self.start = n

    def __iter__(self):
        while self.start >= 0:
            yield self.start
            self.start -= 1

def hailstone(n):
    """
    >>> for num in hailstone(10):
    ...     print(num)
    ...
    10
    5
    16
    8
    4
    2
    1
    """
    "*** YOUR CODE HERE ***"
    while n >= 1:
        if n % 2 == 0:
            yield n
            n = n//2
        elif n == 1:
            yield n
            break
        else:
            yield n
            n = 3*n + 1

