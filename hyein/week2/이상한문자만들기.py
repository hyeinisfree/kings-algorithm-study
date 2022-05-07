def solution(s):
    answer = ''
    index = 0
    
    for c in s:
        if c == ' ':
            answer += c
            index = 0
            continue
          
        answer += c.upper() if index % 2 == 0 else c.lower()
        index += 1
        
    return answer