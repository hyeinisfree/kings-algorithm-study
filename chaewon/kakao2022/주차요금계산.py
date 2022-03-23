import math
from collections import defaultdict


def get_time(time):
    hour, minute = map(int, time.split(":"))
    return hour * 60 + minute


def solution(fees, records):
    answer = []
    receipt = defaultdict(int)
    note = dict()

    for record in records:
        time, number, type = record.split()
        time = get_time(time)
        if type == "IN":
            note[number] = time
        else:
            receipt[number] += (time - note[number])
            del note[number]
    for number in note:
        receipt[number] += (get_time("23:59") - note[number])

    receipt = dict(sorted(receipt.items()))
    for i in receipt.values():
        if i <= fees[0]:
            answer.append(fees[1])
        else:
            answer.append(int(fees[1] + math.ceil((i - fees[0]) / fees[2]) * fees[3]))

    return answer