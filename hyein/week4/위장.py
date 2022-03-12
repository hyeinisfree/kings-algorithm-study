from collections import Counter

def solution(clothes):
    answer = 1
    counter = Counter(map(lambda x: x[1], clothes))
    values = list(counter.values())
    
    for i in values:
        answer *= i+1
    
    return answer-1