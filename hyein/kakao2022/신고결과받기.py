def solution(id_list, report, k):
    answer = [0] * len(id_list)
    report_set = set(report)
    report_dict = dict()
    
    for id in id_list:
        report_dict[id] = []
    
    for r in report_set:
        users = r.split()
        report_dict[users[1]].append(users[0])

    for key in report_dict.keys():
        if len(report_dict[key]) >= k:
            for value in report_dict[key]:
                answer[id_list.index(value)] += 1
    return answer

print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))