def solution(play_time, adv_time, logs):
    answer = ''
    play_time_sec = convert(play_time)
    adv_time_sec = convert(adv_time)
    
    total_time = [0] * (play_time_sec+1)
    for log in logs:
        start, end = log.split('-')
        start_sec = convert(start)
        end_sec = convert(end)
        total_time[start_sec] += 1
        total_time[end_sec] -= 1
        
    for i in range(1, play_time_sec):
        total_time[i] += total_time[i-1]
    print(total_time)
    crnt_sum = sum(total_time[:adv_time_sec])
    max_sum = crnt_sum
    max_idx = 0
    for i in range(adv_time_sec, play_time_sec):
        crnt_sum += total_time[i] - total_time[i-adv_time_sec]
        if crnt_sum > max_sum:
            max_sum = crnt_sum
            max_idx = i-adv_time_sec+1
    
    answer = '%02d:%02d:%02d' % (max_idx/3600, max_idx/60%60, max_idx%60)
    return answer
    
def convert(time):
    h, m, s = map(int, time.split(':'))
    return h * 3600 + m * 60 + s
    
print(solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:25:50-00:48:29", "00:40:31-01:00:00", "01:37:44-02:02:30", "01:30:59-01:53:29"]))