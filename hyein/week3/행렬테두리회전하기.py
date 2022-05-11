def solution(rows, columns, queries):
    answer = []
    matrix = [[row * columns + col + 1 for col in range(columns)] for row in range(rows)]

    for a,b,c,d in queries:
        r1, c1, r2, c2 = a-1, b-1, c-1, d-1
        tmp = matrix[r1][c1]
        min_value = tmp

        for y in range(r1, r2):
            matrix[y][c1] = matrix[y+1][c1]
            min_value = min(min_value, matrix[y+1][c1])
        for x in range(c1, c2):
            matrix[r2][x] = matrix[r2][x+1]
            min_value = min(min_value, matrix[r2][x+1])
        for y in range(r2, r1, -1):
            matrix[y][c2] = matrix[y-1][c2]
            min_value = min(min_value, matrix[y-1][c2])
        for x in range(c2, c1, -1):
            matrix[r1][x] = matrix[r1][x-1]
            min_value = min(min_value, matrix[r1][x-1])

        matrix[r1][c1+1] = tmp
        answer.append(min_value)
        
    return answer