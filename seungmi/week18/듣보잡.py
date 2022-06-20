import sys

n , m= map(int, sys.stdin.readline().rstrip().split())

not_seen=set()
not_heard=set()

#듣도 못한 사람
for _ in range(n):
    not_heard.add(sys.stdin.readline().rstrip())

#보도 못한 사람
for _ in range(m):
    not_seen.add(sys.stdin.readline().rstrip())

seen_heard=sorted(list(not_seen &not_heard))
print(len(seen_heard))
for sh in seen_heard:
    print(sh)