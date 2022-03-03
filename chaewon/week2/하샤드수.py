def solution(x):
    answer = True
    if x % sum(list(map(int, str(x)))) != 0:
        answer = False
    return answer