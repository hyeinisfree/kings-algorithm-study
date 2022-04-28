def solution(distance, rocks, n):
    answer = 0
    start, end = 0, distance
    
    rocks.sort()
    
    #이분 탐색
    while start <= end: 
        mid = (start + end) // 2
        del_stones = 0 #제거한 돌을 카운트하기 위한 변수
        pre_stone = 0 #기준이되는 돌(시작지점)
        for rock in rocks:
            if rock - pre_stone <  mid: 
                del_stones += 1 
            else:
                pre_stone = rock
            if del_stones > n:
            	break
                
        if del_stones > n: 
            end = mid - 1
        else:
            answer = mid
            start = mid + 1
            
    return answer