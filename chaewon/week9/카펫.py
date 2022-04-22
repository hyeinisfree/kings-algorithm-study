def solution(brown, yellow):
    for yellow_row in range(1, int(yellow**(1/2))+1):
        if yellow % yellow_row == 0:
            yellow_column = yellow // yellow_row
        else:
            continue

        brown_row, brown_column = yellow_row + 2, yellow_column + 2
        if brown == brown_row * brown_column - yellow:
            return sorted([brown_row, brown_column], reverse=True)