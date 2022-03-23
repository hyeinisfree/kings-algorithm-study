from collections import deque


def bfs(n, info):
    res = []
    queue = deque([(0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])])
    max_gap = 0

    while queue:
        focus, arrow = queue.popleft()

        if sum(arrow) == n:
            apeach, lion = 0, 0
            for i in range(11):
                if not (info[i] == 0 and arrow[i] == 0):
                    if info[i] >= arrow[i]:
                        apeach += 10 - i
                    else:
                        lion += 10 - i
            if apeach < lion:
                gap = lion - apeach
                if max_gap > gap:
                    continue
                if max_gap < gap:
                    max_gap = gap
                    res.clear()
                res.append(arrow)

        elif sum(arrow) > n:
            continue

        elif focus == 10:
            tmp = arrow.copy()
            tmp[focus] = n - sum(tmp)
            queue.append((-1, tmp))

        else:
            tmp = arrow.copy()
            tmp[focus] = info[focus] + 1
            queue.append((focus + 1, tmp))

            tmp2 = arrow.copy()
            tmp2[focus] = 0
            queue.append((focus + 1, tmp2))
    return res


def solution(n, info):
    winList = bfs(n, info)

    if not winList:
        return [-1]
    elif len(winList) == 1:
        return winList[0]
    else:
        return winList[-1]