def solution(clothes):
    closet = {}
    for cloth in clothes:
        if cloth[1] in closet:
            closet[cloth[1]] += 1
        else:
            closet[cloth[1]] = 1

    answer = 1
    for i in closet.values():
        answer *= (i + 1)
    return answer - 1