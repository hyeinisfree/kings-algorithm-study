from itertools import combinations_with_replacement
from collections import Counter

def solution(n, info):
    max_score = 0
    answer = []
    for i in combinations_with_replacement(range(11), n):
        a_score, l_score = 0,0
        cnt = Counter(i)
        for i in range(11):
            if info[10-i] == 0 and cnt[i] == 0:
                continue
            if info[10-i] >= cnt[i]:
                a_score += i
            else:
                l_score += i
        if max_score < (l_score - a_score) : # 스코어가 더 크다면
            max_score = (l_score - a_score)
            answer = cnt
        elif max_score == (l_score - a_score) and max_score !=0: # 스코어가 같다면
            if answer == [] :
                answer = cnt
            else:
                for i in range(11):
                    if answer[i] == 0 and cnt[i] == 0:
                        continue
                    if answer[i] < cnt[i]:
                        answer = cnt
                        break
                    elif answer[i] > cnt[i]:
                        break
    if answer == []:
        return [-1]
    else:
        temp = answer
        answer = [0]*11
        for i in range(11):
            answer[10-i] = temp[i]
    return answer