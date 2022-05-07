from itertools import combinations_with_replacement

#score 리스트를 비교해 점수 차를 리턴
def compareScore(a_info,b_info):
    a_score=b_score=0
    for i,s in enumerate(a_info) :
        if s==0 and b_info[i]==0:
            continue
        elif s>b_info[i]:
            a_score+=(10-i)
        elif s==b_info[i]:
            a_score+=(10-i)
        else:
            b_score+=(10-i)
    return b_score-a_score


def solution(n, info):
    answer=[]
    max_score_differ=0
    #중복순열
    for cwr in combinations_with_replacement([10,9,8,7,6,5,4,3,2,1,0], n):
        lion_info = [0,0,0,0,0,0,0,0,0,0,0]
        for i in cwr:
            lion_info[10-i]+=1
        score_differ=compareScore(info,lion_info)
        if max_score_differ<score_differ:
            max_score_differ=score_differ
            answer=lion_info
        elif max_score_differ==score_differ and max_score_differ !=0:
            if answer==[]:
                answer=lion_info
            else:
              #점수 차가 같을 경우 더 낮은 점수가 많은 경우에만 
                for i in range(11):
                    if answer[10-i] == 0 and lion_info[10-i] == 0:
                        continue
                    if answer[10-i] < lion_info[10-i]:
                        answer = lion_info
                        break
                    elif answer[10-i] > lion_info[10-i]:
                        break
                
    #이길 수 있는 방법 없음      
    if not answer:
        answer.append(-1)
        
    return answer