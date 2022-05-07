def solution(prices):
    answer = [0]*len(prices)
    
    for index,p in enumerate(prices):
        for i in range(index,len(prices)):
            if p>prices[i]:
                answer[index]=i-index
        if answer[index]==0:
            answer[index]=len(prices)-1-index
                
    return answer