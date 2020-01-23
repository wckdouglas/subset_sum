from flask import flash

def subset_sum(numbers, target, partial=[]):
    '''
    https://stackoverflow.com/questions/4632322/finding-all-possible-combinations-of-numbers-to-reach-a-given-sum
    '''

    cdef:
        int i
        double n
        double s


    try:
        numbers = list(map(float, numbers))
    except ValueError:
        return 'Some of the input numbers are not valid numbers'

    try:
        target = float(target)
    except ValueError:
        return 'Target sum number is not a valid number'

    s = sum(partial)

    # check if the partial sum is equals to target
    if s == target: 
        flash("sum(%s)=%s" % (partial, target))
        return 0

    for i in range(len(numbers)):
        n = numbers[i]
        remaining = numbers[i+1:]
        subset_sum(remaining, target, partial + [n]) 
