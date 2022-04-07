import re

def solution(info, query):
    answer = [0] * len(query)
    
    s_info = []
    for i in info:
        info_list = i.split() 
        s_info.append((''.join([s[0] for s in info_list[:-1]]), int(info_list[-1])))
    print(s_info)
    
    s_query = []
    for q in query:
        query_list = q.split(' and ')
        last = query_list.pop().split()
        if len(last) == 2:
            food, score = last[0], last[1]
        else:
            food, score = last[0], 0
        query_list.append(food)
        s = ''.join([s[0] if s[0] != '-' else '.' for s in query_list])
        s_query.append((s, score))
    
    for idx, sq in enumerate(s_query):
        for si in s_info:
            if re.match(sq[0], si[0]):
                if si[1] >= int(sq[1]):
                    answer[idx] += 1
    return answer

print(solution(["java backend junior pizza 150", "python frontend senior chicken 210", "python frontend senior chicken 150", "cpp backend senior pizza 260", "java backend junior chicken 80", "python backend senior chicken 50"], ["java and backend and junior and pizza 100", "python and frontend and senior and chicken 200", "cpp and - and senior and pizza 250", "- and backend and senior and - 150", "- and - and - and chicken 100", "- and - and - and - 150"]))