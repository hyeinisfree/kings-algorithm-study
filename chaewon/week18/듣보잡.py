import sys

n, m = map(int, sys.stdin.readline().split())
listen = set([sys.stdin.readline()[:-1] for _ in range(n)])
see = set([sys.stdin.readline()[:-1] for _ in range(m)])
result = sorted(list(listen & see))

print(len(result))
[print(i) for i in result]