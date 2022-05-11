def solution(citations):
    answer=0
    #모든 논문의 인용횟수가 0인경우
    if citations==[0]*len(citations):
        return 0
    for i in range(len(citations)+1):
        count=0
        for c in citations:
            if i<=c :
                count+=1
            if count>=i:
                answer=count
                break
    return answer