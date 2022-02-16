def solution(sizes):
    long = 0
    short = 0
    
    for i in sizes:
        if long < max(i):
            long = max(i)
        if short < min(i):
            short = min(i)
        
    return long * short