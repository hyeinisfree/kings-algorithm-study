from itertools import combinations

def solution_fail(number, k):
    return str(max([int(''.join(i)) for i in combinations(number, len(number)-k)]))

def solution(number, k):
    answer = []
    
    for num in number:
        while k > 0 and answer and answer[-1] < num:
            answer.pop()
            k -= 1
        answer.append(num)
        
    return ''.join(answer[:len(answer) - k])