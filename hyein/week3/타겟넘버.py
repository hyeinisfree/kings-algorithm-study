def solution(numbers, target):
    answer = 0
    
    def dfs(graph, v, target, sum): 
        nonlocal answer
        if v == len(graph):
            if sum == target:
                answer += 1
            return
        
        dfs(graph, v+1, target, sum+graph[v])
        dfs(graph, v+1, target, sum-graph[v])
        
    dfs(numbers, 0, target, 0)
    return answer