from collections import deque
import sys

n,m=map(int, sys.stdin.readline().rstrip().split())


queue=deque([n])
visit=[0]*200000

while queue:
  v=queue.popleft()
  if v == m:
    break
  for i in [2*v,v+1,v-1]:
    if  0<=i<200000 and not visit[i]:
      queue.append(i)
      visit[i]=visit[v]+1


print(visit[m])