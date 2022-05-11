import math

def solution(fees, records):
    answer = []
    info = dict()
    
    for r in records:
        item = r.split()
        if item[1] in info.keys():
            info[item[1]].append(item[0])
        else:
            info[item[1]] = []
            info[item[1]].append(item[0])
    
    s_info = sorted(info.items(), key=lambda x: x[0])
    
    for c in s_info:
        car_record = c[1]
        minutes = 0
        if len(car_record) % 2 == 0:
            for i in range(0, len(car_record), 2):
                minutes += solve_minutes(car_record[i], car_record[i+1])
        else: 
            minutes += solve_minutes(car_record[len(car_record)-1], '23:59')
            for i in range(0, len(car_record)-1, 2):
                minutes += solve_minutes(car_record[i], car_record[i+1])
        if minutes > fees[0]:
            fee = fees[1] + math.ceil((minutes-fees[0])/fees[2]) * fees[3]
            answer.append(fee)
        else:
            fee = fees[1]
            answer.append(fee)
            
    return answer

def solve_minutes(in_time, out_time):
    out_h = out_time.split(':')[0]
    out_m = out_time.split(':')[1]
    in_h = in_time.split(':')[0]
    in_m = in_time.split(':')[1]
    
    out_t = 60 * int(out_h) + int(out_m)
    in_t = 60 * int(in_h) + int(in_m)
    
    return out_t - in_t