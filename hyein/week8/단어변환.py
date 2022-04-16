from collections import deque

def solution(begin, target, words):
    if target not in words:
        return 0

    q = deque()
    q.append((begin, 0))

    while q:
        x, cnt = q.popleft()

        if x == target:
            return cnt

        for word in words:
            diff = 0
            for i in range(len(x)):
                if x[i] != word[i]:
                    diff += 1
            if diff == 1:
                q.append((word, cnt + 1))
    return 0