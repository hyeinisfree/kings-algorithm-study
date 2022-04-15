def solution(s):
    answer = len(s)

    for i in range(1, len(s)):
        _zip = []
        cnt = 1
        for j in range(0, len(s), i):
            if s[j: j + i] != s[j + i: j + i + i]:
                if cnt > 1:
                    _zip.append(str(cnt) + s[j: j + i])
                    cnt = 1
                else:
                    _zip.append(s[j: j + i])
            else:
                cnt += 1
        result = "".join(_zip)
        answer = min(answer, len(result))

    return answer