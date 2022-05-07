def compress(s,length):
    target,s,cnt = s[:length], s[length:],1
    answer = ''
    while s:
        if target==s[:length]:
            s,cnt = s[length:], cnt+1
        else:
            answer+=str(cnt)+target if cnt>1 else target
            target,s,cnt = s[:length], s[length:], 1
    return len(answer+str(cnt)+target if cnt>1 else answer+target)

def solution(s):
    answer = len(s)
    for i in range(1,len(s)//2+1):
        answer = min(answer,compress(s,i))
    return answer

print(solution("aabbaccc"))