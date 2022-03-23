def parceling(w):
    cnt = 0
    answer, u, v = "", "", ""
    stack = []
    flag = True
    for i in range(len(w)):
        if w[i] == '(':
            u += w[i]
            stack.append(w[i])
            cnt += 1
        else:
            u += w[i]
            cnt -= 1
            if stack:
                stack.pop()
            else:
                flag = False

        if cnt == 0:
            v = w[i + 1:]
            break

    if flag:
        answer += u
    else:
        answer += transfer(u, v)
        v = ""

    if v != "":
        answer += parceling(v)

    return answer


def transfer(u, v):
    result = "(" + parceling(v) + ")"
    u = u[1: -1]
    for i in u:
        if i == "(":
            result += ")"
        else:
            result += "("

    return result


def solution(p):
    return parceling(p)