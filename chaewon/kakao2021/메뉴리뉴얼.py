from itertools import combinations
from collections import Counter


def solution(orders, course):
    answer = []
    for k in course:
        all_list = []
        for order in orders:
            for menu in combinations(order, k):
                set_menu = ''.join(sorted(menu))
                all_list.append(set_menu)
        all_list = Counter(all_list).most_common()

        for menu, cnt in all_list:
            if cnt > 1 and cnt == all_list[0][1]:
                answer += [menu]
    return sorted(answer)