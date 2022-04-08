import copy

def rotate(key):
    m = len(key)
    new_key = [[0]*m for _ in range(m)]
    for i in range(m):
        for j in range(m):
            new_key[j][m-i-1] = key[i][j]
    return new_key

def check(arr, key, y, x):
    n = len(arr)
    m = len(key)
    new_arr = copy.deepcopy(arr)
    
    for i in range(m):
        for j in range(m):
            new_arr[y+i][x+j] += key[i][j]
    
    for i in range(m-1, n-m+1):
        for j in range(m-1, n-m+1):
            if new_arr[i][j] != 1:
                return False
    return True

def solution(key, lock):
    m = len(key)
    n = len(lock)
    l = 2*(m-1)+n
    
    arr = [[0]*l for _ in range(l)]
    
    for i in range(n):
        for j in range(n):
            arr[i+m-1][j+m-1] = lock[i][j]
            
    for _ in range(4):
        for i in range(m+n-1):
            for j in range(m+n-1):
                if check(arr, key, i, j):
                    return True
        key = rotate(key)
            
    return False

print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))