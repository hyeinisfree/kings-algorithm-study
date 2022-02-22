def solution(array, commands):
    answer = []
    for element in commands:
        i, j, k = element
        answer.append(sorted(array[i-1: j])[k-1])
    return answer