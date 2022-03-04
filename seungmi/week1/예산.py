def solution(d, budget):
    d.sort()
    d_number=0
    for request in d:
        if budget>=request:
            budget-=request
            d_number+=1
        
    return d_number