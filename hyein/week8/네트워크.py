def solution(n, computers):
    answer = 0
    visited = set()
    
    for i in range(n):
        for j in range(n):
            if computers[i][j] and j not in visited:
                answer += 1
                
                stack = [j]
                
                while stack:
                    crnt_idx = stack.pop()
                    visited.add(crnt_idx)
                    
                    for next_idx in range(n):
                        if computers[crnt_idx][next_idx] and next_idx not in visited:
                            visited.add(next_idx)
                            stack.append(next_idx)
                
    return answer
            
print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))