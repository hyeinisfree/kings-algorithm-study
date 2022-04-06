from math import inf

def solution(n, s, a, b, fares):
    s, a, b = s - 1, a - 1, b - 1

    graph = [[inf] * n for _ in range(n)]
    for i in range(n):
        graph[i][i] = 0     

    for fare in fares:
        u, v, w = fare
        graph[u - 1][v - 1] = graph[v - 1][u - 1] = w

    for k in range(n):
        for i in range(n):
            for j in range(n):
                if graph[i][j] > graph[i][k] + graph[k][j]:
                    graph[i][j] = graph[i][k] + graph[k][j]
                # graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])

    answer = inf
    for k in range(n):
        answer = min(answer, graph[s][k] + graph[k][a] + graph[k][b])

    return answer