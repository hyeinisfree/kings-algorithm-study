def converter(n, k):
    converted = ''
    while n > 0:
        n, mod = divmod(n, k)
        converted += str(mod)
    return converted[::-1]


def is_prime(n):
    if n == 0 or n == 1:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True


def solution(n, k):
    answer = 0
    for n in converter(n, k).split('0'):
        if len(n) != 0:
            if is_prime(int(n)):
                answer += 1
    return answer