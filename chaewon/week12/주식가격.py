from collections import deque

def solution(prices):
    answer = []
    queue = deque(prices)

    while queue:
        price = queue.popleft()
        second = 0
        for q in queue:
            second += 1
            if price > q:
                break
        answer.append(second)
    return answer