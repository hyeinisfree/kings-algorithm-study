import sys


def solution(n, r, c):
    if n == 0:
        return 0
    return 2 * (r % 2) + (c % 2) + 4 * solution(n - 1, int(r / 2), int(c / 2))


if __name__ == "__main__":
    n, r, c = map(int, sys.stdin.readline().split())
    print(solution(n, r, c))
