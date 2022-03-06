dx = [-1,0,1,0] # 위, 오른쪽, 아래, 왼쪽
dy = [0,1,0,-1]

# Recursion
import sys
sys.setrecursionlimit(10 ** 6)

def solution1(grid):
    global answer, visited
    answer = []
    visited = [[[False]*4 for _ in range(len(grid[0]))] for _ in range(len(grid))]
    
    for x in range(len(grid)):
        for y in range(len(grid[0])):
            for d in range(4):
                dfs([x,y,d], [x,y,d], 1, grid)
                    
    return sorted(answer)

def dfs(state, org, cnt, grid):
    x, y, d = state[0], state[1], state[2]
    visited[x][y][d] = True
    
    nx = (x + dx[d]) % len(grid)
    ny = (y + dy[d]) % len(grid[0])
    
    if grid[nx][ny] == 'R':
        d = (d+1)%4
    elif grid[nx][ny] == 'L':
        d = (d-1)%4
    if (nx, ny, d) == (org[0], org[1], org[2]):
        answer.append(cnt)
        return
    if not visited[nx][ny][d]:
        dfs([nx, ny, d], org, cnt+1, grid)
        
# Iterative
def solution2(grid):
    global visited
    answer = []
    visited = [[[False]*4 for _ in range(len(grid[0]))] for _ in range(len(grid))]
    
    for x in range(len(grid)):
        for y in range(len(grid[0])):
            for d in range(4):
                if not visited[x][y][d]:
                    cnt = dfs(x,y,d,grid)
                    if cnt != 0:
                        answer.append(cnt)
                
    return sorted(answer)

def dfs(x, y, d, grid):
    visited[x][y][d] = True
    nx, ny, nd = x, y, d``
    cnt = 0
    while True:
        nx = (nx + dx[nd]) % len(grid)
        ny = (ny + dy[nd]) % len(grid[0])
        cnt += 1
        
        if grid[nx][ny] == 'R':
            nd = (nd+1)%4
        elif grid[nx][ny] == 'L':
            nd = (nd-1)%4
        if visited[nx][ny][nd]:
            if (nx,ny,nd) == (x,y,d):
                return cnt
            else:
                return 0
        visited[nx][ny][nd] = True

print(solution2(["SL","LR"]))