def solution(s):
    min_len=len(s)
    for i in range(1,len(s)//2+1):
        s_list=[]
        s_copy=s
        
        compressed_s=""
        while s_copy:
            s_list.append(s_copy[:i])
            s_copy=s_copy[i:]
        tmp=s_list.pop(0)
        count=1
        while s_list:
            if tmp==s_list[0]:
                count+=1
                if len(s_list)==1:
                    if count!=1:
                        compressed_s+=str(count)+tmp
                    else:
                        compressed_s+=tmp
                    break
                s_list.pop(0)
            else:
                if count!=1:
                    compressed_s+=str(count)+tmp
                else:
                    compressed_s+=tmp
                if len(s_list)==1:
                    compressed_s+=s_list.pop(0)
                    break
                tmp=s_list.pop(0)
                count=1
        min_len=min(min_len,len(compressed_s))
    return min_len