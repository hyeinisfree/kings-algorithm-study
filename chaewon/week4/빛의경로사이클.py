def solution(grid):
    row, col = len(grid), len(grid[0])
    direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]  # 위 오른쪽 아래 왼쪽
    visited = [[[0, 0, 0, 0] for _ in range(col)] for _ in range(row)]

    def solve(x, y, d):
        result = 0
        while not visited[x][y][d]:
            visited[x][y][d] = 1
            x, y = (x + direction[d][0]) % row, (y + direction[d][1]) % col
            if grid[x][y] == 'L':
                d = (d + 1) % 4
            elif grid[x][y] == 'R':
                d = (d - 1) % 4
            result += 1
        return result

    answer = []
    for i in range(row):
        for j in range(col):
            for k in range(4):
                if visited[i][j][k] == 0:
                    answer.append(solve(i, j, k))
    return sorted(answer)