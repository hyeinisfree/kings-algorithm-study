import sys


def fibonacci(num):
    length = len(zero)
    if num >= length:
        for i in range(length, num + 1):
            zero.append(zero[i - 1] + zero[i - 2])
            one.append(one[i - 1] + one[i - 2])
    print('{} {}'.format(zero[num], one[num]))


if __name__ == '__main__':
    input = sys.stdin.readline

    zero = [1, 0, 1]
    one = [0, 1, 1]

    for _ in range(int(input().rstrip())):
        fibonacci(int(input().rstrip()))
