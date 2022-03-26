def impossible(result):
    COL, ROW = 0, 1
    for x, y, a in result:
        # 기둥일 경우
        if a == COL:
            if y != 0 and (x, y - 1, COL) not in result and (x - 1, y, ROW) not in result and (x, y, ROW) not in result:
                return True
        # 보일 경우
        else:
            if (x, y - 1, COL) not in result and (x + 1, y - 1, COL) not in result and not ((x - 1, y, ROW) in result and (x + 1, y, ROW) in result):
                return True
    return False


def solution(n, build_frame):
    result = set()

    for x, y, a, build in build_frame:
        item = (x, y, a)

        # 추가
        if build:
            result.add(item)
            if impossible(result):
                result.remove(item)
        # 삭제
        elif item in result:
            result.remove(item)
            if impossible(result):
                result.add(item)
    answer = map(list, result)

    return sorted(answer, key=lambda x: (x[0], x[1], x[2]))