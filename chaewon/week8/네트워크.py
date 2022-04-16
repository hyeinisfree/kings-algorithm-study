def dfs(n, computers, computer, visited):
    visited[computer] = True
    for other_computer in range(n):
        if other_computer != computer and computers[computer][other_computer] == 1:
            if not visited[other_computer]:
                dfs(n, computers, other_computer, visited)


def solution(n, computers):
    answer = 0
    visited = [False for _ in range(n)]
    for computer in range(n):
        if not visited[computer]:
            dfs(n, computers, computer, visited)
            answer += 1

    return answer