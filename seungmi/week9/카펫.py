from math import sqrt

def solution(brown, yellow):
    #카페트의 가로 길이를 w , 세로 길이를 h라고 했을 때 w>h인 조건에서 
    #w+h=(brown+4)/2
    #w*h=brown*yellow이다.
    #그러므로 x^2+bx+c=0 형태의 이차방정식의 근해공식을 이용하여 해결
    b=(-1)*((brown+4)/2)
    c=brown+yellow
    
    return [int((int(sqrt(b*b-4*c))-b)/2),int((-1)*b-((int(sqrt(b*b-4*c))-b)/2))]