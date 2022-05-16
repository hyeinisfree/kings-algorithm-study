from collections import deque

def solution(n, edge):
    graph =[[] for _ in range(n + 1)]
    distances = [0 for _ in range(n)]
    visited = [False for _ in range(n)]
    for (a, b) in edge:
        graph[a-1].append(b-1)
        graph[b-1].append(a-1)

    queue = deque([0])
    visited[0] = True
    
    while queue:
        x = queue.popleft()

        for next in graph[x]:
            if not visited[next]:
                visited[next] = True
                queue.append(next)
                distances[next] = distances[x] + 1

    max_v = max(distances)
    answer = distances.count(max_v)

    return answer