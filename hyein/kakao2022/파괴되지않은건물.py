def solution(board, skill):
    answer = 0
    
    n = len(board)
    m = len(board[0])
    
    imos = [[0] * m for i in range(n)]
    
    for sk in skill:
        type, r1, c1, r2, c2, degree = sk
        if type == 1:
            degree = -degree
        imos[r1][c1] += degree
        if c2 + 1 < m:
            imos[r1][c2 + 1] -= degree
        if r2 + 1 < n:
            imos[r2 + 1][c1] -= degree
        if c2 + 1 < m and r2 + 1 < n:
            imos[r2 + 1][c2 + 1] += degree
    
    for i in range(n):
        for j in range(1, m):
            imos[i][j] = imos[i][j] + imos[i][j - 1]

    for j in range(m):
        for i in range(1, n):
            imos[i][j] = imos[i][j] + imos[i - 1][j]
    
    for i in range(n):
        for j in range(m):
            board[i][j] += imos[i][j]
            if board[i][j] > 0:
                answer += 1
    
    return answer