from lab05 import *

## Extra Trees, Dictionaries Questions ##

#########
# Trees #
#########

# Q5

def height(t):

    """Return the depth of the deepest node in the tree.

    >>> height(tree(1))
    0
    >>> height(tree(1, [tree(2), tree(3)]))
    1
    >>> print_tree(numbers)
    1
      2
      3
        4
        5
      6
        7
    >>> height(numbers)
    2
    """
    if is_leaf(t):
        return 0
    else:
        return 1 + max([height(b) for b in branches(t)])

# Q6
def acorn_finder(t):

    """Returns True if t contains a node with the value 'acorn' and
    False otherwise.

    >>> sproul = tree('roots', [tree('branch1', [tree('leaf'), tree('acorn')]), tree('branch2')])
    >>> acorn_finder(sproul)
    True
    >>> acorn_finder(numbers)
    False
    """


    if root(t) == 'acorn':
        return True
    elif is_leaf(t):
        if root(t) == 'acorn':
            return True
    else:
        if 'acorn' in [acorn_finder(i) for i in branches(t)]:
            return True
        else:
            return False

# Q7
def preorder(t):
    """Return a list of the entries in this tree in the order that they
    would be visited by a preorder traversal (see problem description).

    >>> preorder(numbers)
    [1, 2, 3, 4, 5, 6, 7]
    >>> preorder(tree(2, [tree(4, [tree(6)])]))
    [2, 4, 6]
    """
    "*** YOUR CODE HERE ***"

################
# Dictionaries #
################

# Q8``

def build_successors_table(tokens):

    """Return a dictionary: keys are words; values are lists of
    successors.

    >>> text = ['We', 'came', 'to', 'investigate', ',', 'catch', 'bad', 'guys', 'and', 'to', 'eat', 'pie', '.']
    >>> table = build_successors_table(text)
    >>> sorted(table)
    [',', '.', 'We', 'and', 'bad', 'came', 'catch', 'eat', 'guys', 'investigate', 'pie', 'to']
    >>> table['to']
    ['investigate', 'eat']
    >>> table['pie']
    ['.']
    >>> table['.']
    ['We']
    """
    table = {}
    prev = '.'
    for word in tokens:
        if prev not in table:
            table[prev] = [word]
        else:
            table[prev] = table[prev] + [word]
        prev = word
    return table

# Q9

def construct_sent(word, table):

    """Prints a random sentence starting with word, sampling from
    table.
    """
    import random
    result = ' '
    while word not in ['.', '!', '?']:
        word = random.choice(table[word])
        result += word + ' '
    return result + word

# Warning: do NOT try to print the return result of this function

def shakespeare_tokens(path='shakespeare.txt', url='http://goo.gl/SztLfX'):
    """Return the words of Shakespeare's plays as a list."""
    import os
    from urllib.request import urlopen
    if os.path.exists(path):
        return open('shakespeare.txt', encoding='ascii').read().split()
    else:
        shakespeare = urlopen(url)
        return shakespeare.read().decode(encoding='ascii').split()

# Uncomment the following two lines
tokens = shakespeare_tokens()
table = build_successors_table(tokens)


def random_sent():
    import random
    return construct_sent(random.choice(table['.']), table)

text_file = open("Output.txt", "w")
i = 0
while i < 100:
    text_file.write(random_sent())
    i = i + 1

text_file.close()
