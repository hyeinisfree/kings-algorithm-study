def solution(id_list, report, k):
    report = set(report)
    answer = [0] * len(id_list)
    reported = {x: 0 for x in id_list}

    for r in report:
        reported[r.split()[1]] += 1

    for r in report:
        if reported[r.split()[1]] >= k:
            answer[id_list.index(r.split()[0])] += 1

    return answer