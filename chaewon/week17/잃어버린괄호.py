import sys

if __name__ == '__main__':
    expression = sys.stdin.readline().strip().split('-')

    res = 0
    for i in expression[0].split('+'):
        res += int(i)

    for i in expression[1:]:
        for j in i.split('+'):
            res -= int(j)
    print(res)
