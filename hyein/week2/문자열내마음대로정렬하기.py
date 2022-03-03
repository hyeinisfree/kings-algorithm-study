def solution(strings, n):
    return sorted(strings, key=lambda s : (s[n], s))