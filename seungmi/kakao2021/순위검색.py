def solution(info, query):
    answer=[]
    # 총 경우의 수 (108가지)
    info_dict = {}

    for lang in ['cpp', 'java', 'python', "-"]:
        for job in ['backend', 'frontend', "-"]:
            for career in ['junior', 'senior', "-"]:
                for food in ['chicken', 'pizza', "-"]:
                    info_dict[lang + job + career + food] = []

    # 지원자의 경우의 수 (1인, 16가지)
    for i in info:
        info = i.split(" ")
        for lang in [info[0], "-"]:
            for job in [info[1], "-"]:
                for career in [info[2], "-"]:
                    for food in [info[3], "-"]:
                        info_dict[lang + job + career + food].append(int(info[4]))
    
           
    #효율성 0점 .. 
    # for index,q in enumerate(query):
    #     q=q.replace(" and "," ")
    #     lang, job, career, food, score=q.split(" ")
    #     if info_dict[lang + job + career + food]:
    #         for i_score in info_dict[lang + job + career + food]:
    #             if i_score>=int(score):
    #                 answer[index]+=1
    
    # for q in query:
    #     q=q.replace(" and "," ")
    #     lang, job, career, food, score=q.split(" ")
    #     score_list=sorted(info_dict[lang+job+career+food],reverse=True)
    #     for index, sl in enumerate(score_list):
    #         if int(score) <=sl:
    #             if len(score_list)==index+1:
    #                 answer.append(index+1)
    #             else :
    #                 continue
    #         else:
    #             answer.append(index)
    #             break
    
    #미리 정렬이 중요
    for key in info_dict.keys():
        info_dict[key].sort()
    #이진 탐색
    for q in query:
        q = q.replace(" and ", "")
        condition,score = q.split()
        query_score = int(score)
        info_score = info_dict[condition]
        l = len(info_score)
        tmp = l
        low, high = 0, l - 1

        while low <= high:
            mid = (low + high) // 2

            if query_score <= info_score[mid]:
                tmp = mid
                high = mid - 1
            else:
                low = mid + 1

        answer.append(l - tmp)


    return answer