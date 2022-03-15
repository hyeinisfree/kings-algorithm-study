import math

def solution(n, k):
    answer = 0
    num = change(n, k)
    for x in num.split('0'):
        if x == '':
            continue
        if is_prime(int(x)):
            answer += 1
    return answer

def change(n, k):
    result = []
    while n > 0:
        result.append(str(n % k))
        n //= k
    return ''.join(reversed(result))

def is_prime(n):
    if n == 1:
        return False
    for i in range(2, int(math.sqrt(n))+1):
        if n % i == 0:
            return False
    return True