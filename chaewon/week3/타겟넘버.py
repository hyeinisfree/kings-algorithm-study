from itertools import product

def solution(numbers, target):
    _list = [(x, -x) for x in numbers]
    _sum = list(map(sum, product(*_list)))
    return _sum.count(target)