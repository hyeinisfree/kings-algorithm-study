def dfs(graph,v,visited):
    #방문노드 표시
    visited[v]=True
    for i in graph[v]:
        if not visited[i]:
            dfs(graph,i,visited)
    return visited

def solution(n, computers):
    answer = 0
    graph=[[]*n for i in range(n)]
    for i in range(n):
        for j in range(n):
            if computers[i][j]==1:
                graph[i].append(j)
    visited=[False]*n            
    
    node=[i for i in range(n)]
    print(node)
    while node:
        answer+=1
        visited=dfs(graph,node.pop(0),visited)
        for i,n in enumerate(visited):
            if n and i in node:
                node.remove(i)
        
    return answer