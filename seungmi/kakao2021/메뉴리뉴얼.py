from itertools import combinations

def solution(orders, course):
    answer = []
    order_combi={}
    for num in course:
        for o in orders:
            if len(o)>=num:
                for combi in combinations(list(o),num):
                    c=tuple(sorted(combi))
                    if c not in order_combi:
                        order_combi[c]=1
                    else:
                        order_combi[c]+=1
                
    
    
    max_num={}
    for num in course:
        count=1
        for o in order_combi:
            if len(o)==num and order_combi[o]>1 and order_combi[o]>count:
                count=order_combi[o]
                max_num[num]=count
                
    for o in order_combi:
        if len(o) in max_num.keys() and order_combi[o]==max_num[len(o)]:
            answer.append(''.join(o))
    answer.sort()
    return answer