def solution(name):
    answer = 0
    
    n = len(name)
    move = n - 1
    for idx, c in enumerate(name):
        answer += min(ord(c) - ord('A'), ord('Z') - ord(c) + 1)
        
        next_idx = idx + 1
        while next_idx < n and name[next_idx] == 'A':
            next_idx += 1
            
        distance = min(idx, n - next_idx)
        move = min(move, idx + n - next_idx + distance)

    return answer + move