def solution(lottos, win_nums):
    #알아볼 수 없는 숫자의 갯수
    count=lottos.count(0)
    match=0
    #당첨된 번호 갯수
    for num in lottos:
        if num in win_nums:
            match+=1
    
    return [7-(count+match) if count+match!=0 else 6,7-match if match!=0 else 6]