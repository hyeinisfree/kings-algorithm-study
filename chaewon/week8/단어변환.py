from collections import deque


def solution(begin, target, words):
    answer = 0

    queue = deque()
    queue.append((begin, 0))
    visited = [False for _ in range(len(words))]

    while queue:
        word, count = queue.popleft()

        if word == target:
            answer = count
            break
        for i in range(len(words)):
            temp_count = 0
            if not visited[i]:
                for j in range(len(word)):
                    if word[j] != words[i][j]:
                        temp_count += 1
                if temp_count == 1:
                    queue.append((words[i], count + 1))
                    visited[i] = True
    return answer