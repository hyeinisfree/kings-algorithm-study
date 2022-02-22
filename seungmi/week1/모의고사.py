def solution(answers):
    answer=[]
    counts= [0,0,0]
    s1=[1,2,3,4,5]
    s2=[2,1,2,3,2,4,2,5]
    s3=[3,3,1,1,2,2,4,4,5,5]
    count=0
    for a in answers:
        if a==s1[count%5]:
            counts[0]+=1
        if a==s2[count%8]:
            counts[1]+=1
        if a==s3[count%10]:
            counts[2]+=1
        count+=1
    student=1
    for c in counts:
        if c==max(counts):
            answer.append(student)
        student+=1
    return answer