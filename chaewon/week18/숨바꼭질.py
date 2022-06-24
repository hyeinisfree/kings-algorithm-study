import sys
from collections import deque


def bfs(v):
    queue = deque([v])
    while queue:
        x = queue.popleft()
        if x == k:
            return visited[x]
        for i in (x - 1, x + 1, x * 2):
            if 0 <= i <= MAX and not visited[i]:
                visited[i] = visited[x] + 1
                queue.append(i)


MAX = 10 ** 5
visited = [0] * (MAX + 1)
n, k = map(int, sys.stdin.readline().split())
print(bfs(n))