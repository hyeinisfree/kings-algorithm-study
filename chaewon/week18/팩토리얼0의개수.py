import sys
from math import factorial

n = int(sys.stdin.readline())
cnt = 0
for x in str(factorial(n))[::-1]:
    if x != '0':
        break
    cnt += 1
print(cnt)
