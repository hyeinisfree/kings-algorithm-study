def solution(operations):
    nums=[]
    for o in operations:
        operator=o.split(' ')[0]
        num=int(o.split(' ')[1])
        if operator=='I':
            nums.append(num)
            nums.sort()
        if operator =='D':
            if num==1 and nums:
                nums.pop()
            if num==-1 and nums:
                nums.pop(0)
                
    if not nums:
        return [0,0]
    
    return [max(nums),min(nums)]