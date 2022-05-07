from collections import defaultdict

def expand_num(n):
    #모든 수를 4자리 수로 만듦
    n=int(str(n)+str((n%10))*(4-len(str(n))))
    return n
    
def solution(numbers):
    answer=''
    number_dic=defaultdict(list)
    #수의 앞번호에 따라 분류 후 정렬
    for n in numbers:
        number_dic[str(n)[0]].append(n)
    for s in number_dic:
        number_dic[s]=sorted(number_dic[s],key=lambda x : (expand_num(x),-len(str(x))),reverse=True)

    for s in sorted(number_dic,reverse=True):
        answer+=''.join(map(str,number_dic[s]))
        
    answer=str(int(answer))
        
    return answer

print(solution([1,10,100,1000]))