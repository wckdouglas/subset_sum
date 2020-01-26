from flask import flash
from functools import partial

def subset_sum(numbers, target, partial_list=[], local=False):
    '''
    https://stackoverflow.com/questions/4632322/finding-all-possible-combinations-of-numbers-to-reach-a-given-sum
    '''

    cdef:
        double s, n
        int i


    s = sum(partial_list)
    print(partial_list, s)

    # check if the partial_list sum is equals to target
    if s == target: 
        msg = "sum(%s)=%s" % (partial_list, target)
        if local:
            print(msg)
        else:
            flash(msg)
        return 0

    if s > target:
        return 0

    for i in range(len(numbers)):
        n = numbers[i]
        remaining = numbers[i+1:]
        subset_sum(remaining, target, partial_list + [n]) 


def wrapper(numbers, target, partial_list=[], local=False):
    try:
        numbers = list(map(float, numbers))
        numbers.sort()
    except ValueError:
        return 'Some of the input numbers are not valid numbers'

    try:
        target = float(target)
    except ValueError:
        return 'Target sum number is not a valid number'

    res = subset_sum(numbers, target, partial_list = partial_list, local=local)
    return res


