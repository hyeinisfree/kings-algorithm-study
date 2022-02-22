def solution(d, budget):
    d.sort()
    while budget < sum(d):
        d.pop()
    return len(d)