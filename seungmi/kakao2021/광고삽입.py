# from itertools import accumulate

def cal_second(s):
    hour,minute,second=s.split(":")
    return int(hour)*3600+int(minute)*60+int(second)

def solution(play_time, adv_time, logs):
    play_time=cal_second(play_time)
    adv_time=cal_second(adv_time)
    dp = [0] * (play_time + 1)
    
    if play_time==adv_time:
        return "00:00:00"
    
    for i in logs:
        start, end = i.split('-')
        start = cal_second(start)
        end = cal_second(end)
        dp[start] += 1
        dp[end] -= 1
    
    #accumulate(dp) 쓰면 테스트케이스 9,31 오류남
    # dp=list(accumulate(dp))   
    # dp=list(accumulate(dp))
    for i in range(1, play_time):
        dp[i] += dp[i-1]
    for i in range(1, play_time):
        dp[i] +=dp[i-1]
    
    max_value = -1
    answer = 0
    for i in range(adv_time-1, play_time):
        temp = dp[i] - dp[i-adv_time] 
        if temp > max_value:
            max_value = temp
            answer = i-adv_time + 1
            
    return "{:0>2}:{:0>2}:{:0>2}".format(answer//3600,(answer%3600)//60,answer%60)