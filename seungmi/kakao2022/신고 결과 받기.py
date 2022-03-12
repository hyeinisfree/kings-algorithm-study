
def solution(id_list, report, k):
    answer = []
    id_dic={}
    # id_dic=[유저 : [유저가 신고한 id],[정지된 id],당한 신고 횟수]
    for id in id_list:
        id_dic[id]=[[],[],0]
    #report 분석 후 신고 카운트    
    for r in report:
        r_list=r.split(" ")
        if r_list[1] not in id_dic[r_list[0]][0]:
            id_dic[r_list[0]][0].append(r_list[1])
            id_dic[r_list[1]][2]+=1
    #정지된 id
    for p1 in id_dic:
        if id_dic[p1][2]>=k:
            for p2 in id_dic:
                if p1 in id_dic[p2][0]:
                    id_dic[p2][1].append(p1)

    return [len(id_dic[id][1]) for id in id_dic]