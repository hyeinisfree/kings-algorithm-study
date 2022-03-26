from collections import deque


def solution(board, r, c):
    answer = 0
    board = ''.join(str(card) for row in board for card in row)
    directions = ((1, 0), (-1, 0), (0, 1), (0, -1))
    que = deque([(r, c, 0, -1, board)])
    visited = set()

    while que:
        y, x, count, enter, board = que.popleft()

        # 게임 끝
        if board.count('0') == 16:
            return count
        if (y, x, enter, board) in visited:
            continue
        visited.add((y, x, enter, board))

        for dy, dx in directions:
            # 방향키 이동
            ny, nx = y + dy, x + dx
            if 0 <= ny < 4 and 0 <= nx < 4:
                que.append((ny, nx, count + 1, enter, board))

            # ctrl + 방향키 이동
            ny, nx = ctrl_move(y, x, dy, dx, board)
            if ny == y and nx == x:
                continue
            que.append((ny, nx, count + 1, enter, board))

        # 엔터
        position = y * 4 + x

        if board[position] != 0:
            if enter == -1:
                que.append((y, x, count + 1, position, board))
            elif enter != position and board[enter] == board[position]:
                board = board.replace(board[enter], '0')
                que.append((y, x, count + 1, -1, board))
    return answer


def ctrl_move(y, x, dy, dx, board):
    ny, nx = y + dy, x + dx
    if 0 <= ny < 4 and 0 <= nx < 4:
        if board[ny * 4 + nx] == '0':
            return ctrl_move(ny, nx, dy, dx, board)
        else:
            return ny, nx
    else:
        return y, x