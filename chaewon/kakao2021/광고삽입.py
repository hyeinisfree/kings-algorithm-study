def get_time(time):
    hour, minute, second = map(int, time.split(":"))
    return hour * 3600 + minute * 60 + second


def get_string(time):
    hour = str(time // 3600).zfill(2)
    minute = str(time % 3600 // 60).zfill(2)
    second = str(time % 3600 % 60).zfill(2)
    return hour + ":" + minute + ":" + second


def solution(play_time, adv_time, logs):
    play_time = get_time(play_time)
    adv_time = get_time(adv_time)
    all_time = [0 for i in range(play_time + 1)]

    for log in logs:
        start, end = log.split('-')
        start = get_time(start)
        end = get_time(end)
        all_time[start] += 1
        all_time[end] -= 1

    for i in range(1, len(all_time)):
        all_time[i] = all_time[i] + all_time[i - 1]
    for i in range(1, len(all_time)):
        all_time[i] = all_time[i] + all_time[i - 1]

    most_view, max_time = 0, 0
    for i in range(adv_time - 1, play_time):
        if i >= adv_time:
            temp = all_time[i] - all_time[i - adv_time]
            if most_view < temp:
                most_view = temp
                max_time = i - adv_time + 1
        else:
            if most_view < all_time[i]:
                most_view = all_time[i]
                max_time = i - adv_time + 1

    return get_string(max_time)