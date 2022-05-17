from collections import deque

def bfs(v, visited, vertex):
    count = 0
    queue = deque([[v, count]])
    while queue:
        value = queue.popleft()
        v, count = value[0], value[1]
        if visited[v] == -1:
            visited[v] = count
            count += 1
            for e in vertex[v]:
                queue.append([e, count])

def solution(n, edge):
    answer = 0
    visited = [-1] * (n + 1)
    vertex = [[] for _ in range(n + 1)]
    for e in edge:
        x, y = e[0], e[1]
        vertex[x].append(y)
        vertex[y].append(x)

    bfs(1, visited, vertex)
    for value in visited:
        if value == max(visited):
            answer += 1
    return answer