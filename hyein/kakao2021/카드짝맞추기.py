from collections import deque

d = [(1, 0), (-1, 0), (0, 1), (0, -1)]

def end_game(b):
    if b.count("0") == 16:
        return True
    return False

def remove_element(b, e):
    b = b.replace(e, "0")
    return b

def move(b, y, x, dy, dx):
    ny, nx = y + dy, x + dx
    if ny >= 0 and ny < 4 and nx >= 0 and nx < 4 and b[ny * 4 + nx] == "0":
        return move(b, ny, nx, dy, dx)
    else:
        if ny >= 0 and ny < 4 and nx >= 0 and nx < 4:
            return (ny, nx)
        else:
            return (y, x)

def solution(board, r, c):
    answer = 0
    b = ""
    for i in range(4):
        for j in range(4):
            b += str(board[i][j])
    q = deque([])
    enter = -1
    q.append((r, c, b, 0, enter))
    s = set()
    cnt = 0

    while q:
        y, x, b, c, e = q.popleft()
        if (y, x, b, c, e) in s:
            continue
        s.add((y,x, b, c, e))

        pos = 4 * y + x
        if end_game(b):
            return c

        for (dy, dx) in d:
            ny, nx = y + dy, x + dx
            if ny >= 0 and ny < 4 and nx >= 0 and nx < 4:
                q.append((ny, nx, b, c+1, e))

        for (dy, dx) in d:
            ny, nx = move(b, y, x, dy, dx)
            if ny == y and nx == x:
                continue
            q.append((ny, nx, b, c+1, e))

        if b[pos] != 0:
            if e == -1:
                n_e = pos
                q.append((y, x, b, c+1, n_e))
            else:
                if e != pos and b[e] == b[pos]:
                    n_b = remove_element(b, b[e])
                    q.append((y, x, n_b, c+1, -1))

    return answer