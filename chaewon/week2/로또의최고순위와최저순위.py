def solution(lottos, win_nums):
    rule = {6: 1, 5: 2, 4: 3, 3: 4, 2: 5, 1: 6, 0: 6}
    equal = len(set(lottos) & set(win_nums))
    zero = lottos.count(0)

    return [rule.get(equal + zero), rule.get(equal)]