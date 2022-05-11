# def solution(board, skill):
#     answer = 0
#     for type, r1, c1, r2, c2, degree in skill:
#         for i in range(r1,r2+1):
#             for k in range(c1,c2+1):
#                 board[i][k]+=degree if type ==2 else -degree
#     for row in board:
#         for biluding in row:
#             if biluding>0:
#                 answer+=1      
#     return answer

from itertools import accumulate
def solution(board, skill):
    answer = 0
    #누적합에 사용하기 위해 배열의 크기를 행과 열 각각 1씩 크게 만든다
    
    tmp = [[0] * (len(board[0]) + 1) for _ in range(len(board) + 1)] 

    for type, r1, c1, r2, c2, degree in skill:
        tmp[r1][c1] += degree if type == 2 else -degree
        tmp[r1][c2 + 1] += -degree if type == 2 else degree
        tmp[r2 + 1][c1] += -degree if type == 2 else degree
        tmp[r2 + 1][c2 + 1] += degree if type == 2 else -degree
        
    # 행 기준 누적합
    for i in range(len(tmp) - 1):
        tmp[i]=list(accumulate(tmp[i]))
    # 열 기준 누적합
    for j in range(len(tmp[0]) - 1):
        for i in range(len(tmp) - 1):
            tmp[i + 1][j] += tmp[i][j]
    # 기존 배열과 합함
    for i in range(len(board)):
        for j in range(len(board[i])):
            board[i][j] += tmp[i][j]
            # 파괴되지 않은 건물
            if board[i][j] > 0: 
                answer += 1
    return answer