import heapq
INF=int(1e9)



def dijkstra(start, distance, graph):
    q=[]
    sequence=[]
    sequence.append(start)
    #시작 노드로 가기 위한 최단 경로는 0으로 설정, 큐에 삽입
    heapq.heappush(q,(0,start))
    distance[start]=0
    while q:
        dist,now=heapq.heappop(q)
        if distance[now]<dist:
            continue
        for i in graph[now]:
            cost=dist+i[1]
            if cost<distance[i[0]]:
                distance[i[0]]=cost
                heapq.heappush(q,(cost,i[0]))
                sequence.append(i[0])
    return distance, sequence
                
def solution(n, s, a, b, fares):
    answer = 0
    distance=[INF]*(n+1)
    graph=[[] for i in range(n+1)]
    for start, end, w in fares:
        graph[start].append((end,w))
        graph[end].append((start,w))
    
    distance, sequence=dijkstra(s, distance , graph)
    min_fare=distance[a]+distance[b]
    
    while True:
        sequence.pop(0)
        if not sequence:
            break
        new_start=sequence[0]
        mini_distance=[INF]*(n+1)
        mini_distance, mini_sequence=dijkstra(sequence[0],mini_distance,graph)
        min_fare=min(min_fare,mini_distance[a]+mini_distance[b]+distance[sequence[0]])
    
    return min_fare