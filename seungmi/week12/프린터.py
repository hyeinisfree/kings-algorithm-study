def solution(priorities, location):
    answer = 0
    doc=[]
    for i, p in enumerate(priorities):
        doc.append((i,p))
    
    print(doc)
    while(doc):
        if doc[0][1]==max(i[1] for i in doc):
            #중요도가 가장 큼
            d=doc.pop(0)
            answer+=1
            if location==d[0]:
                return answer
        else :
            #남아있는 문서 중에 중요도가 가장 크지 않으면 맨 뒤로 보낸다
            d=doc.pop(0)
            doc.append(d)
            
    return answer