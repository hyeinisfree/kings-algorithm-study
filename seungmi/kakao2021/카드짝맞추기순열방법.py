from itertools import permutations
from collections import defaultdict


def solution(board, r, c):
    
    card_set=set()
    for b in board:
        card_set.update(b)
    card_set.remove(0)
    min_count=int(1e9)
    
    
    #카드가 쌍으로 존재하므로 두개의 위치좌표 리스트를 value로 갖는 dic 생성
    card_dic=defaultdict(list)
    for i, b in enumerate(board):
        for j, card in enumerate(b):
            if card !=0:
                card_dic[card].append([i,j])
                
    current_loc=[r,c]
    #카드 순서 정하기
    for p in permutations(card_set,len(card_set)):
        count=0
        for card in p:
            temp,loc=getCount(current_loc,card_dic[card])
            temp2,loc2=getCount(current_loc,reversed(card_dic[card]))
            if temp<temp2:
                count+=temp
                current_loc=loc
            else:
                count+=temp2
                current_loc=loc2
                
            
        min_count=min(min_count,count)
        
    return min_count
#카드 두장 위치 리스트를 넘겼을 때 두장을 모두 고른 키 조작 수 반환
def getCount(c_loc,two_card):
    location=c_loc
    count=0
    for c in two_card:
        if c[0]==location[0] or c[1]==location[1]:
            count+=2
            location=c
        else:
            count+=3
            location=c
    return count,location
    
print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]]	,1,0))