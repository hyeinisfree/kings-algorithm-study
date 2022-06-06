import collections

def solution(arrows):
    answer = 0
    move=[(-1,0),(-1,1),(0,1),(1,1),(1,0),(1,-1),(0,-1),(-1,-1)]
    now=(0,0)
    
    #방문노드
    visited=collections.defaultdict(bool)
    #방문간선
    visited_edge=collections.defaultdict(int)
    
    q=collections.deque([now])
    for i in arrows:
        for _ in range(2):
            next=(now[0]+move[i][0],now[1]+move[i][1])
            q.append(next)
            now=next
            
            
    now= q.popleft()
    visited[now]=1
    
    while q:
        next=q.popleft()
        if visited[next]:
            if visited_edge[(now,next)]==0:
                answer+=1
        else:
            visited[next]=True
        
        visited_edge[(now,next)]=1
        visited_edge[(next,now)]=1
        now=next
        
    return answer