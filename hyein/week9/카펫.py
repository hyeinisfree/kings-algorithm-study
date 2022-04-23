def solution(brown, yellow):
    total = brown + yellow
    for i in range(3, total + 1):
        if total % i == 0:
            w = total / i
            h = i
            if w + h == (brown + 4) / 2:
                return [w, h]