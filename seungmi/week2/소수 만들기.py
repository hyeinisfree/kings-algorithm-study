from itertools import combinations
#소수 판별
def isPrime(number):
    for i in range(2,int(number**(1/2))+1):
        if number%i==0:
            return False
    return True

def solution(nums):
    answer=0
    for combination in list(combinations(nums, 3)):
        if isPrime(combination[0]+combination[1]+combination[2]):
            answer+=1
    return answer