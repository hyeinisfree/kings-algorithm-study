from itertools import permutations
import math

def solution1(numbers):
    answer = 0
    
    for i in range(1, len(numbers) + 1):
        perm = list(permutations(numbers, i))
        for item in set(perm):
            if item[0] == '0':
                continue
            num = int(''.join(item))
            if num >= 2 and is_prime(num):
                answer += 1
                
    return answer

def solution2(numbers):
    answer = 0
    
    data = set()
    for i in range(1, len(numbers) + 1):
        data.update(map(int, map(''.join, permutations(numbers, i))))
        
    for item in data:
        if item >= 2 and is_prime(item):
            answer += 1
            
    return answer

def is_prime(x):
    for i in range(2, int(math.sqrt(x)) + 1):
        if x % i == 0:
            return False
    return True