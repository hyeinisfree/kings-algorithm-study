import sys
from collections import deque


def bfs(node):
    # 위, 아래, 왼, 오
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]

    map = deque()
    map.append(node)
    while map:
        x, y = map.popleft()

        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]

            if 0 <= nx < n and 0 <= ny < m:
                if maze[nx][ny] == 1:
                    maze[nx][ny] = maze[x][y] + 1
                    map.append((nx, ny))

    return maze[n-1][m-1]


n, m = map(int, sys.stdin.readline().split())
maze = []
for _ in range(n):
    maze.append(list(map(int, sys.stdin.readline()[:-1])))
print(bfs((0, 0)))
