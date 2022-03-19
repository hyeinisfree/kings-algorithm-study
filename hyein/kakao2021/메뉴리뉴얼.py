from itertools import combinations
from collections import Counter

def solution(orders, course):
    answer = []
    
    tmp_menu = set()
    set_menu = []
    for order in orders:
        for i in course:
            comb = set(combinations(order, i))
            for c in comb:
                m = ''.join(sorted(c))
                if m in tmp_menu:
                    set_menu.append(m)
                tmp_menu.add(m)
                
    counter = Counter(set_menu)
            
    max_order = [-1] * 11
    for key in counter.keys():
        if counter[key] > max_order[len(key)]:
            max_order[len(key)] = counter[key]
    
    for key in counter.keys():
        if counter[key] == max_order[len(key)]:
            answer.append(key)
    
    return sorted(answer)

print(solution(	["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2, 3, 4]))