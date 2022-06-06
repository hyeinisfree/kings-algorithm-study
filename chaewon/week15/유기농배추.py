import sys
from collections import deque


def bfs(y, x, ground):
    dx = [-1, 0, 0, 1]
    dy = [0, 1, -1, 0]

    queue = deque()
    queue.append((y, x))
    ground[y][x] = 0

    while queue:
        y, x = queue.popleft()

        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            if 0 <= nx < m and 0 <= ny < n:
                if ground[ny][nx] == 1:
                    queue.append((ny, nx))
                    ground[ny][nx] = 0


if __name__ == "__main__":
    for _ in range(int(sys.stdin.readline())):
        m, n, k = map(int, sys.stdin.readline().split())
        count = 0
        ground = [[0] * m for _ in range(n)]
        for _ in range(k):
            x, y = map(int, sys.stdin.readline().split())
            ground[y][x] = 1

        for i in range(n):
            for j in range(m):
                if ground[i][j] == 1:
                    bfs(i, j, ground)
                    count += 1
        print(count)
