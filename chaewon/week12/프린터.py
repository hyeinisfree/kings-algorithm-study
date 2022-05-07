from collections import deque

def solution(priorities, location):
    answer = 0
    queue = deque([(name, i) for i, name in enumerate(priorities)])

    while True:
        J = queue.popleft()
        if queue and max(queue)[0] > J[0]:
            queue.append(J)
        else:
            answer += 1
            if J[1] == location:
                break
    return answer