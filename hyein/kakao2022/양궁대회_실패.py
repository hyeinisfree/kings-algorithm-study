import sys
sys.setrecursionlimit(10 ** 6)

def solution(n, info):
    global answer, apeach, now
    answer = []
    apeach = [i for i in range(len(info)) if info[i] != 0]
    now = -1
    win = [a+1 for a in info]
    
    for i in range(0, len(info)):
        bt(win, i, n, [])
    
    if now == -1:
        return [-1]
    
    result = answer[-1]
    s = [win[i] if i in result else 0 for i in range(len(info))]
    if s[-1] != 0:
        s[-1] = n - sum(s[:-1])
    return s
    
def lion_win(lion):
    global answer, apeach, now
    apeach_set = set(apeach)-set(lion)
    apeach_score = sum([10-i for i in apeach_set])
    lion_score = sum([10-i for i in lion])
    if lion_score > apeach_score:
        win_score = lion_score - apeach_score
        if win_score >= now:
            answer.append(lion.copy())
            now = win_score

def bt(graph, idx, n, visited):
    global answer
    if n == 0:
        lion_win(visited)
        return
    if idx == 11:
        lion_win(visited)
        return
    if n < 0:
        return
    
    for next_idx in range(idx, len(graph)):
        visited.append(next_idx)   
        bt(graph, next_idx+1, n-graph[next_idx], visited)
        visited.pop()
    return