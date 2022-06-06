def solution(n, costs):
    answer = 0
    costs.sort(key=lambda x: x[2])
    routes = {costs[0][0]}

    while len(routes) != n:
        for i, cost in enumerate(costs):
            if cost[0] in routes and cost[1] in routes:
                continue
            if cost[0] in routes or cost[1] in routes:
                routes.update([cost[0], cost[1]])
                answer += cost[2]
                costs[i] = [-1, -1, -1]
                break
    return answer