import sys

if __name__ == '__main__':
    target = int(sys.stdin.readline().strip())
    m = int(sys.stdin.readline())
    if m:   # 고장난 버튼이 있을 경우
        broken = set(sys.stdin.readline().split())
    else:
        broken = set()

    ans = abs(100 - target) # ++나 --로만 이동할 경우 : 최댓값
    for channel in range(1000001):
        for n in str(channel):
            if n in broken: # 해당 숫자가 고장나있는 경우 break
                break
        else: # min(기존 답, 번호 누른 횟수 + 해당 번호에서 타겟까지의 차)
            ans = min(ans, abs(channel - target) + len(str(channel)))
    print(ans)
