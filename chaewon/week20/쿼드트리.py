import sys


def quadtree(x, y, n):
    # 픽셀이 1개만 남았을 경우
    if n == 1:
        return str(image[x][y])

    result = []
    for i in range(x, x + n):
        for j in range(y, y + n):
            if image[i][j] != image[x][y]:  # 색이 다른 경우 다시 4분할
                n = n // 2

                result.append('(')
                result.extend(quadtree(x, y, n))    # 오른쪽 위
                result.extend(quadtree(x, y + n, n))    # 왼쪽 위
                result.extend(quadtree(x + n, y, n))    # 오른쪽 아래
                result.extend(quadtree(x + n, y + n, n))    # 왼쪽 아래
                result.append(')')

                return result

    return str(image[x][y])


n = int(sys.stdin.readline())
image = [list(map(int, sys.stdin.readline()[:-1])) for _ in range(n)]

print(''.join(quadtree(0, 0, n)))