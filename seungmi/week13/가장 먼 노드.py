import collections

def solution(n, edge):
    dists = {i:0 for i in range(1, n+1)}   
    graph = collections.defaultdict(list)
    
    for v, u in edge:                   
        graph[v].append(u)
        graph[u].append(v)
        
    q = collections.deque(graph[1])        
    dist = 1 
    
    while q:                              
        for i in range(len(q)):
            v = q.popleft()
            
            if dists[v] == 0:
                dists[v] = dist
                
                for w in graph[v]:
                    q.append(w)
        dist += 1        

    del dists[1]                          
    max_value = max(dists.values())
    answer = 0
    for v in dists.values():              
        if v == max_value:
            answer += 1
        
    return answer