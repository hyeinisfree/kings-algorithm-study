def solution(distance, rocks, n): 
    answer = 0 
    left, right = 0, distance 
    rocks.append(distance) 
    rocks.sort() 
    
    while left <= right: 
        mid = (left + right) // 2 
        current, remove = 0, 0
        min_distance = float('inf')
        
        for rock in rocks: 
            dis = rock - current 
            if dis < mid: 
                remove += 1 
            else:
                current = rock
                min_distance = min(min_distance, dis) 
                
        if remove > n: 
            right = mid - 1
        else: 
            answer = min_distance 
            left = mid + 1 
            
    return answer
