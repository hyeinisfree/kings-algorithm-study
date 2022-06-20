from collections import deque

polynomial=input().split('-')
q=deque()
for p in polynomial:
  if '+' in p:
    q.append(sum(list(map(int,p.split('+')))))
  else:
    q.append(int(p))

result=q.popleft()

while q:
  result-=q.popleft()


print(result)


