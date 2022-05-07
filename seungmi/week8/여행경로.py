#런타임 에러
def solution(tickets):
    route=[]
    route.append('ICN')
    #갈 수 있는 경로를 탐색후 경로에 추가함
    while tickets:
        v=route[-1]
        out_list=[]
        for t_in, t_out in tickets:
            if t_in==v:
                out_list.append(t_out)
        out_list.sort()
        route.append(out_list[0])
        tickets.remove([v,out_list[0]])
        
    return route


#통과 코드
from collections import defaultdict
def solution2(tickets):
    tickets_dic = defaultdict(list)
    for i,j in tickets:
        tickets_dic[i].append(j)
    for i in tickets_dic:
        tickets_dic[i].sort()

    s = ["ICN"]
    p = []
    while s:
        q = s[-1]
        if tickets_dic[q] != []:
            s.append(tickets_dic[q].pop(0))
        else:
            p.append(s.pop())
    return p[::-1]


