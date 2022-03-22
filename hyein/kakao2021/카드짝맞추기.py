from math import inf
from itertools import permutations
from collections import deque
import copy

def ctrl_move(x, y, d):
    global board_c
    while True:
        nx = x + d[0]
        ny = y + d[1]
        if nx < 0 or nx >= 4 or ny < 0 or ny >= 4:
            return x, y
        else:
            if board_c[nx][ny] != 0:
                return nx, ny
            x, y = nx, ny
    
def bfs(sx, sy, ex, ey):
    global board_c
    
    d = {0:[-1, 0], 1:[0, 1], 2:[1, 0], 3:[0, -1]} # 위, 오른쪽, 아래, 왼쪽
    
    if (sx, sy) == (ex, ey):
        return 1
    
    queue = deque([[sx, sy]])
    board = [[0]*4 for _ in range(4)]
    visited = [[False]*4 for _ in range(4)]
    visited[sx][sy] = True
    
    while queue:
        x, y = queue.popleft()
        for i in range(4):
            nx = x + d[i][0]
            ny = y + d[i][1]
            if 0 <= nx < 4 and 0 <= ny < 4 and not visited[nx][ny]:
                board[nx][ny] = board[x][y] + 1
                visited[nx][ny] = True
                if (nx, ny) == (ex, ey):
                    return board[nx][ny] + 1
                queue.append([nx, ny])
            
            nx, ny = ctrl_move(x, y, d[i])
            if not visited[nx][ny]:
                board[nx][ny] = board[x][y] + 1
                visited[nx][ny] = True
                if (nx, ny) == (ex, ey):
                    return board[nx][ny] + 1
                queue.append([nx, ny])

def remove_card(card):
    global board_c, card_position
    for x, y in card_position[card]:
        board_c[x][y] = 0
    
def restore_card(card):
    global board_c, card_position
    for x, y in card_position[card]:
        board_c[x][y] = card
    
def go(sx, sy, order, count, move):
    global answer, card_position, card_num
    if count == card_num:
        answer = min(answer, move)
        return
    
    card = order[count]
    
    left = card_position[card][0]
    right = card_position[card][1]
    
    d1 = bfs(sx, sy, left[0], left[1])
    d2 = bfs(left[0], left[1], right[0], right[1])
    
    remove_card(card)
    go(right[0], right[1], order, count+1, move+d1+d2)
    restore_card(card)

    d1 = bfs(sx, sy, right[0], right[1])
    d2 = bfs(right[0], right[1], left[0], left[1])
    
    remove_card(card)
    go(left[0], left[1], order, count+1, move+d1+d2)
    restore_card(card)
    
def solution(board, r, c):
    global answer, board_c, card_position, card_num
    
    answer = inf
    board_c = copy.deepcopy(board)
    card_position = {}
    
    for i in range(4):
        for j in range(4):
            num = board[i][j]
            if num != 0:
                if num in card_position.keys():
                    card_position[num].append([i, j])
                else:
                    card_position[num] = [[i, j]]

    orders = list(card_position.keys())
    order_p = list(permutations(orders, len(orders)))
    card_num = len(orders)
    
    for order in order_p:
        go(r, c, order, 0, 0)
        
    return answer
    
print(solution([[1, 0, 0, 3], [2, 0, 0, 0], [0, 0, 0, 2], [3, 0, 1, 0]], 1, 0))