def check(answer): 
    for x, y, stuff in answer: 
        if stuff == 0: 
            if y == 0 or [x-1, y, 1] in answer or [x, y, 1] in answer or [x, y-1, 0] in answer: 
                continue 
            return False 
        elif stuff == 1:
            if [x, y-1, 0] in answer or [x+1, y-1, 0] in answer or ([x-1, y, 1] in answer and [x+1, y, 1] in answer): 
                continue 
            return False 
    return True 
    
def solution(n, build_frame): 
    answer = [] 
    for build in build_frame: 
        x, y, stuff, operation = build 
        if operation == 1: # 설치 
            answer.append([x, y, stuff]) 
            if not check(answer): answer.remove([x, y, stuff]) 
        elif operation == 0: # 삭제 
            answer.remove([x, y, stuff]) 
            if not check(answer): answer.append([x, y, stuff]) 
    answer.sort() 
    return answer