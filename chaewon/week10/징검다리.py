def solution(distance, rocks, n):
    answer = 0
    start, end = 1, distance

    rocks.sort()
    while start <= end:
        mid = (start + end) // 2
        min_distance = float('inf')
        current, remove = 0, 0
        for rock in rocks:
            distance = rock - current
            if distance < mid:
                remove += 1
            else:
                current = rock
                min_distance = min(min_distance, distance)

        if remove > n:
            end = mid - 1
        else:
            answer = min_distance
            start = mid + 1

    return answer