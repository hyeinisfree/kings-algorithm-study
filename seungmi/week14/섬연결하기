def solution(n, costs):
    costs = sorted(costs, key=lambda x:x[2])
    node = set([costs[0][0], costs[0][1]])
    answer = costs[0][2]

    while len(node) != n:
        for i in range(1, len(costs)):
            if costs[i][0] in node and costs[i][1] in node:
                continue
            if costs[i][0] in node or costs[i][1] in node:
                node.update([costs[i][0], costs[i][1]])
                answer += costs[i][2]
                break
    return answer