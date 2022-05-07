def solution(N, number):
    
    if N==number:
        return 1
    
    s=[set() for x in range(8)]
    
    for i,s_set in enumerate(s, start=1):
        s_set.add(int(str(N)*i))
        
    for i in range(1, 8):
        for j in range(i):
            for op1 in s[j]:
                for op2 in s[i-j-1]:
                    s[i].add(op1 + op2)
                    s[i].add(op1 - op2)
                    s[i].add(op1 * op2)
                    if op2 != 0:
                        s[i].add(op1 // op2)

        if  number in s[i]:
            answer = i + 1
            break

    else:
        answer = -1

    return answer
