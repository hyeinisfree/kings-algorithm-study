def solution(lottos, win_nums):
    rank=[6,6,5,4,3,2,1]

    zero_count = 0
    correct_count = 0
    for x in lottos:
        if x == 0:
            zero_count += 1
        elif x in win_nums:
            correct_count += 1
            
    return rank[correct_count + zero_count],rank[correct_count]