def solution(rows, columns, queries):
    array = [[0 for col in range(columns)] for row in range(rows)]
    value = 1
    for row in range(rows):
        for col in range(columns):
            array[row][col] = value
            value += 1

    answer = []
    for query in queries:
        x1, y1, x2, y2 = query[0] - 1, query[1] - 1, query[2] - 1, query[3] - 1
        temp = array[x2][y2]
        small = temp

        # right
        for i in range(x2, x1, -1):
            array[i][y2] = array[i - 1][y2]
            small = min(small, array[i][y2])
        # top
        for i in range(y2, y1, -1):
            array[x1][i] = array[x1][i - 1]
            small = min(small, array[x1][i])
        # left
        for i in range(x1, x2):
            array[i][y1] = array[i + 1][y1]
            small = min(small, array[i][y1])
        # bottom
        for i in range(y1, y2):
            array[x2][i] = array[x2][i + 1]
            small = min(small, array[x2][i])
        array[x2][y2-1] = temp

        answer.append(small)
    return answer