def solution(board, skill):
    answer = 0
    
    n = len(board)
    m = len(board[0])
    
    dp = [[0] * m for i in range(n)]
    
    for sk in skill:
        type, r1, c1, r2, c2, degree = sk
        if type == 1:
            degree = -degree
        dp[r1][c1] += degree
        if c2 + 1 < m:
            dp[r1][c2 + 1] -= degree
        if r2 + 1 < n:
            dp[r2 + 1][c1] -= degree
        if c2 + 1 < m and r2 + 1 < n:
            dp[r2 + 1][c2 + 1] += degree
    
    for i in range(n):
        for j in range(1, m):
            dp[i][j] = dp[i][j] + dp[i][j - 1]

    for j in range(m):
        for i in range(1, n):
            dp[i][j] = dp[i][j] + dp[i - 1][j]
    
    for i in range(n):
        for j in range(m):
            board[i][j] += dp[i][j]
            if board[i][j] > 0:
                answer += 1
    
    return answer