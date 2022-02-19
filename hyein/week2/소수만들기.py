from itertools import combinations
import math

def solution(nums):
    answer = 0
    comb = list(combinations(nums, 3))
    
    for c in comb:
        if is_prime(sum(c)):
            answer += 1

    return answer

def is_prime(num):
    for i in range(2, int(math.sqrt(num)) + 1):
        if num % i == 0:
            return False
          
    return True