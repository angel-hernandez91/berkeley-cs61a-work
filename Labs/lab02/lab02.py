"""Required questions for lab 2"""

## Boolean Operators ##

# Q6
def both_positive(x, y):
    """
    Returns True if both x and y are positive.
    >>> both_positive(-1, 1)
    False
    >>> both_positive(1, 1)
    True
    """
    if x <= 0 and y <= 0:
        return False
    elif x <= 0 and y >= 0:
        return False
    elif x >= 0 and y <= 0:
        return False
    else:
        return True
    

## while Loops ##

# Q9
def factors(n):
    """Prints out all of the numbers that divide `n` evenly.

    >>> factors(20)
    20
    10
    5
    4
    2
    1
    """
    k = 1
    while k <= n:
        if n%k == 0:
            print(n // k)
        k = k +1
        

# Q10
def fib(n):
    """Returns the nth Fibonacci number.

    >>> fib(0)
    0
    >>> fib(1)
    1
    >>> fib(2)
    1
    >>> fib(3)
    2
    >>> fib(4)
    3
    >>> fib(5)
    5
    >>> fib(6)
    8
    """

    k = 1
    f_prev2 = 0
    f_prev1 = 1
    if n == 0:
        return f_prev2
    elif n == 1:
        return f_prev1
    else:
        while k < n:
            f_current = f_prev1 + f_prev2
            f_prev2 = f_prev1
            f_prev1 = f_current
            k = k + 1
        return f_current



