import sys

if __name__ == '__main__':
    input = sys.stdin.readline
    n, m = map(int, input().split())
    book = {}

    for i in range(1, n + 1):
        a = input().rstrip()
        book[i] = a
        book[a] = i

    for i in range(m):
        question = input().rstrip()
        if question.isdigit():
            print(book[int(question)])
        else:
            print(book[question])