from math import inf


def solution(n, s, a, b, fares):
    graph = [[inf] * n for _ in range(n)]

    # 자기 자신에게 갈 때
    for i in range(n):
        graph[i][i] = 0

    # 단방향 그래프이기 때문에 행렬을 뒤집은 곳에 같은 값 저장
    for fare in fares:
        node1, node2, weight = fare
        graph[node1 - 1][node2 - 1] = graph[node2 - 1][node1 - 1] = weight

    # t 지점을 경우했을 경우의 가중치가 더 작을 때 값 갱신
    for t in range(n):
        for i in range(n):
            for j in range(n):
                if graph[i][j] > graph[i][t] + graph[t][j]:
                    graph[i][j] = graph[j][i] = graph[i][t] + graph[t][j]

    # 경유점에 따른 최소 비용 탐색
    answer = inf
    for t in range(n):
        answer = min(answer, graph[s - 1][t] + graph[t][a - 1] + graph[t][b - 1])

    return answer