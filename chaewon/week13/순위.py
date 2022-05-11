def solution(n, results):
    answer = 0
    game = [[0] * n for _ in range(n)]

    for winner, loser in results:
        game[winner - 1][loser - 1] = 1
        game[loser - 1][winner - 1] = -1

    for k in range(n):
        for i in range(n):
            for j in range(n):
                if i == j or game[i][j] in [1, -1]:
                    continue
                if game[i][k] == game[k][j] == 1:
                    game[i][j] = 1
                    game[j][i] = game[k][i] = game[j][k] = -1

    for person in game:
        if person.count(0) == 1:
            answer += 1

    return answer