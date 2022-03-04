import itertools
import math

def isPrime(num):
    for i in range(2, int(math.sqrt(num)) + 1):
        if num % i == 0:
            return False
    return True

def solution(numbers):
    answer = []
    numbers = list(numbers)

    perm = []
    for i in range(1, len(numbers) + 1):
        perm += list(itertools.permutations(numbers, i))
    nums = [int(("").join(p)) for p in perm]

    for num in nums:
        if num < 2:
            continue
        if isPrime(num):
            answer.append(num)

    return len(set(answer))