from collections import defaultdict


def solution(genres, plays):
    answer = []
    music_dic=defaultdict(list)
    music_list=[]
    for index, music in enumerate(zip(genres,plays)):
        music_dic[music[0]].append((music[1],index))
    
    for m in music_dic:
        sum=0
        for play, num in music_dic[m]:
            sum+=play
        music_list.append((m,sum))
    #속한 노래가 많이 재생된 장르를 먼저 수록
    music_list=sorted(music_list,key=lambda x : x[1],reverse=True)
    while music_list:
        count=2
        #장르 내에서 많이 재생된 노래 , 고유번호가 낮은 노래 
        music=sorted(music_dic[music_list.pop(0)[0]],key=lambda x: (-x[0],-x[1]))
        while music and count:
            count-=1
            answer.append(music.pop(0)[1])
        
    
    
    return answer