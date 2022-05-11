def solution(n, lost, reserve):  
    students=list(range(1,n+1))
    lost.sort()
    reserve.sort()
    lost_list=lost.copy()
    
    #여분을 갖고 있는데 잃어버린 사람은 빌려주지 못함
    for a in lost_list:
        if a in reserve:
            reserve.remove(a)
            lost.remove(a)
    lost_list=lost.copy()        

    for a in lost_list:
        if a-1 in reserve:
            reserve.remove(a-1)
            continue
        if a+1 in reserve:
            reserve.remove(a+1)
            continue
        students.remove(a)
        
    return len(students)