def solution(n, times):
    answer = 0
    
    left = min(times)
    right = max(times)*n
    while left <= right:
        mid = (left+ right) // 2
        checked = 0
        for time in times:
            checked += mid // time

            if checked >= n:
                break
        
        # 심사한 사람의 수가 심사 받아야할 사람의 수(n)보다 거나 같은 경우
        if checked >= n:
            answer = mid
            right = mid - 1
        # 심사한 사람의 수가 심사 받아야할 사람의 수(n)보다 적은 경우
        elif checked < n:
            left = mid + 1
            
    return answer