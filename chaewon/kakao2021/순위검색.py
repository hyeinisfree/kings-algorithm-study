from bisect import bisect_left
from collections import defaultdict
from itertools import combinations


def solution(info, query):
    answer = []
    info_dict = defaultdict(list)

    for applicant in info:
        inform = applicant.split()
        _key = inform[:-1]
        _val = int(inform[-1])

        for i in range(5):
            for comb in combinations(_key, i):
                tmp = ''.join(comb)
                info_dict[tmp].append(_val)

    for k in info_dict:
        info_dict[k].sort()

    for condition in query:
        myquery = condition.split(' ')
        _key = myquery[:-1]
        _val = myquery[-1]

        while 'and' in _key:
            _key.remove('and')
        while '-' in _key:
            _key.remove('-')
        _key = ''.join(_key)

        if _key in info_dict:
            scores = info_dict[_key]
            if scores:
                find_index = bisect_left(scores, int(_val))
                answer.append(len(scores) - find_index)
        else:
            answer.append(0)

    return answer
