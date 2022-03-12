def gcd(a, b):
    if a == 0:
        return b
    return gcd(b%a, a)

def solution(w, h):
    return (w*h) - (w+h-gcd(w, h))