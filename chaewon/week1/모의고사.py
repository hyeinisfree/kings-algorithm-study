def solution(answers):
    scores = [0, 0, 0]

    one = [1, 2, 3, 4, 5]
    two = [2, 1, 2, 3, 2, 4, 2, 5]
    three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

    for i, answer in enumerate(answers):
        if answer == one[i % len(one)]:
            scores[0] += 1
        if answer == two[i % len(two)]:
            scores[1] += 1
        if answer == three[i % len(three)]:
            scores[2] += 1

    answer = []
    max_score = max(scores)
    for i, score in enumerate(scores):
        if score == max_score:
            answer.append(i+1)
    return answer