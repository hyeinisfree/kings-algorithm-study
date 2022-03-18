import datetime as dt
import math

def cal_time(in_time,out_time):
    time = str(dt.datetime.strptime(out_time,'%H:%M')-dt.datetime.strptime(in_time,'%H:%M'))
    return int(time.split(":")[0])*60+int(time.split(":")[1])

def solution(fees, records):
    record_dic={}
    fee_dic={}

    #차량 별 사용시간 계산
    #record_dic={"차량번호":[입차시간, 입/출차 여부,누적시간] }
    for record in records:
        car_info=record.split(" ")
        if car_info[1] not in record_dic.keys():
            record_dic[car_info[1]]=[car_info[0],car_info[2],0]
            continue
        if car_info[2]=="IN":
            record_dic[car_info[1]][0]=car_info[0]
            record_dic[car_info[1]][1]=car_info[2]
            
        else:
            record_dic[car_info[1]][2]+=cal_time(record_dic[car_info[1]][0],car_info[0])
            record_dic[car_info[1]][1]=car_info[2]
            
    #미 출차 차량 시간계산 /사용 요금 계산
    for car_num in record_dic:
        if record_dic[car_num][1]=="IN":
            record_dic[car_num][2]+=cal_time(record_dic[car_num][0],"23:59")
            record_dic[car_num][1]="OUT"
        
        if record_dic[car_num][2]<fees[0]:
            fee_dic[car_num]=fees[1]
            continue
        fee_dic[car_num]=fees[1]+math.ceil((record_dic[car_num][2]-fees[0])/fees[2])*fees[3]
    
    return [i[1] for i in sorted(fee_dic.items())]