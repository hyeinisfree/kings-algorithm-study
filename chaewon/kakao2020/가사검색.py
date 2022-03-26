import bisect
import collections


def func(a, left, right):
    left_idx = bisect.bisect_left(a, left)
    right_idx = bisect.bisect_right(a, right)

    return right_idx - left_idx


def solution(words, queries):
    answer = []

    # 단어 길이 순으로 분리
    dic = collections.defaultdict(list)
    dic_reverse = collections.defaultdict(list)
    for word in words:
        dic[len(word)].append(word)
        dic_reverse[len(word)].append(word[::-1])

    for key in dic.keys():
        dic[key].sort()
        dic_reverse[key].sort()

    for query in queries:
        # 접미사 와일드 카드
        if query[0] != '?':
            answer.append(func(dic[len(query)], query.replace('?', 'a'), query.replace('?', 'z')))

        # 접두사 와일드 카드
        else:
            query = query[::-1]
            answer.append(func(dic_reverse[len(query)], query.replace('?', 'a'), query.replace('?', 'z')))
    return answer