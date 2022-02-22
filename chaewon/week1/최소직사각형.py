def solution(sizes):
    return max(max(i) for i in sizes) * max(min(i) for i in sizes)