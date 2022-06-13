from collections import deque

def dfs(graph,v,visited):
  visited[v]=True
  print(v, end=" ")
  for i in graph[v]:
    if not visited[i]:
      dfs(graph,i,visited)

def bfs(graph,v,visited):
  queue=deque([v])
  visited[v]=True
  while queue:
    node=queue.popleft()
    print(node,end=' ')
    for i in graph[node]:
      if not visited[i]:
        queue.append(i)
        visited[i]=True


n,m,v=map(int, input().split())
graph=[[] for _ in range(0,n+1)]

for _ in range(m):
  a,b=map(int, input().split())
  graph[a].append(b)
  graph[b].append(a)

for i in range(n+1):
  graph[i]=sorted(list(set(graph[i])))

print(graph)

visited=[False]*(n+1)
dfs(graph,v,visited)
print()
visited=[False]*(n+1)
bfs(graph,v,visited)




