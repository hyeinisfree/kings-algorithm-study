
def solution(sizes):
    max_w=0
    max_h=0
    
    for size in sizes:
      #세로의 길이가 더 길 때
        if size[0]<size[1] :
            max_w=max(size[1],max_w)
            max_h=max(size[0],max_h)
      #가로의 길이가 더 길 때
        else:
            max_w=max(size[0],max_w)
            max_h=max(size[1],max_h)
    
    return  max_w*max_h