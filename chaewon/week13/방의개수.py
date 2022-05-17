import collections


def solution(arrows):
    answer = 0
    move = [(-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1)]
    now = (0, 0)

    # visited : 노드 방문 체크
    # visited_dir : 노드 방문 경로 체크 ((A, B)는 A -> B 경로)
    visited = collections.defaultdict(int)
    visited_route = collections.defaultdict(int)

    # arrows 따라 노드 좌표를 큐에 추가
    queue = collections.deque([now])
    for i in arrows:
        # 모래 시계 형태 예외 처리를 위해 해당 방향으로 2칸씩 추가
        for _ in range(2):
            next = (now[0] + move[i][0], now[1] + move[i][1])
            queue.append(next)

            now = next

    now = queue.popleft()
    visited[now] = 1

    while queue:
        next = queue.popleft()

        # 이미 방문한 노드인 경우
        if visited[next] == 1:
            # 해당 경로로 처음 들어온 경우 방 생성
            if visited_route[(now, next)] == 0:
                answer += 1
        # 처음 방문한 노드인 경우 방문 체크
        else:
            visited[next] = 1

        # 해당 노드로 들어온 경로 방문 체크
        visited_route[(now, next)] = 1
        visited_route[(next, now)] = 1
        now = next

    return answer