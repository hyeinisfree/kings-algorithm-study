def solution(n, info):
    global apeach, ryan, win
    apeach = info
    answer = []
    ryan = []
    win = [x+1 for x in info]
    
    for i in range(11):
        bt(i, n, [0]*11)
    
    if len(ryan) == 0:
        return [-1]
    if len(ryan) == 1:
        return ryan[0][0]
    
    s_ryan = sorted(ryan, key=lambda x: x[1], reverse=True)
    print(s_ryan)
    max_score = s_ryan[0][1]
    
    if s_ryan[1][1] < max_score:
        return s_ryan[0][0]
    
    for idx in range(len(s_ryan)):
        if s_ryan[idx][1] < max_score:
            tmp = s_ryan[:idx]
            break
        elif idx == len(s_ryan)-1:
            tmp = s_ryan
    
    result = []
    for t in range(len(tmp)):
        for i in range(10,-1,-1):
            if tmp[t][0][i] != 0:
                result.append((i, tmp[t][0][i], t))
                break
                
    return tmp[sorted(result)[-1][2]][0]

def get_score(ryan):
    global apeach
    score = 0
    for i in range(11):
        if ryan[i] == apeach[i] == 0:
            continue
        if ryan[i] > apeach[i]:
            score += 10-i
        else:
            score -= 10-i
    return score
    
def bt(idx, n, shoot):
    global ryan, win
    
    if idx == 10:
        shoot[idx] = n
        score = get_score(shoot)
        if score > 0:
            ryan.append((shoot.copy(), score))
        shoot[idx] = 0
        return
    
    shoot[idx] = win[idx]
    n -= win[idx]
    
    if n < 0:
        shoot[idx] = 0
        return
    elif n == 0:
        score = get_score(shoot)
        if score > 0:
            ryan.append((shoot.copy(), score))
        shoot[idx] = 0
        return
    
    for next_idx in range(idx+1, 11):
        bt(next_idx, n, shoot)
        
    n += win[idx]
    shoot[idx] = 0
    
    return
    
print(solution(5, [2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0]))