INF=int(1e9)
n, m = map(int, input().split())

graph=[[INF]*(n+1) for _ in range(n+1)]


for a in range(1,n+1):
  for b in range(1,n+1):
    if a==b:
      graph[a][b]=0

for _ in range(m):
  a,b=map(int,input().split())
  graph[a][b]=graph[b][a]=1


for k in range(1,n+1):
  for a in range(1,n+1):
    for b in range(1,n+1):
      graph[a][b]=min(graph[a][b],graph[a][k]+graph[k][b])

bacon_number=INF
bacon=0

for i in range(1,n+1):
  sum=0
  for j in graph[i]:
    if j==INF:
      continue
    sum+=j
  if sum<bacon_number:
    bacon=i
    bacon_number=sum
 
print(i)


