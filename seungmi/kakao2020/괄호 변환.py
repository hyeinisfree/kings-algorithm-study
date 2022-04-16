def divide(p):
    open_p = 0
    close_p = 0

    for i in range(len(p)):
        if p[i] == '(':
            open_p += 1
        else:
            close_p += 1
        if open_p == close_p:
            return p[:i + 1], p[i + 1:]


# 문자열 u가 올바른 괄호 문자열인지 확인하는 함수
def check(u):
    stack = []

    for p in u:
        if p == '(':
            stack.append(p)
        else:
            if not stack:
                return False
            stack.pop()

    return True


def solution(p):
    # step 1
    if not p:
        return ""

    # step 2
    u, v = divide(p)

    # step 3
    if check(u):
        # step 3-1
        return u + solution(v)
    # step 4
    else:
        #step  4-1
        answer = '('
        # step 4-2
        answer += solution(v)
        # step 4-3
        answer += ')'

        # step 4-4
        for p in u[1:len(u) - 1]:
            if p == '(':
                answer += ')'
            else:
                answer += '('

        # step 4-5
        return answer