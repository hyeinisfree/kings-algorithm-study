import math 

def convert(n,k):
    temp=""
    while n>k:
        temp+=str(n%k)
        n=int(n/k)
    temp+=str(n)
    return temp[::-1]

# def convert(n, k) :
#     jinsu = ''
#     while n > 0 :
#         n, mod = divmod(n, k)
#         jinsu += str(mod)
#     return jinsu[::-1]

# 소수 판별 함수
def is_prime_number(x):
    if x==0 or x==1:
        return False
    for i in range(2, int(math.sqrt(x)) + 1):
        if x % i == 0:
            return False 
    return True 

def solution(n, k):
    answer = 0
    num_list=convert(n,k).split('0')
    for num in num_list:
        if num.isdigit() and is_prime_number(int(num)):
            answer+=1
    return answer