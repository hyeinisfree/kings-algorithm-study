import sys

if __name__ == '__main__':
    n = int(sys.stdin.readline())
    conference = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
    conference = sorted(conference, key=lambda x: x[0])
    conference = sorted(conference, key=lambda x: x[1])

    last, cnt = 0, 0
    for i, j in conference:
        if i >= last:
            cnt += 1
            last = j
    print(cnt)
