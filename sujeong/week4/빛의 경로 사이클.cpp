#include <string>
#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;

bool visit[501][501][4][4];
int dr[] = {0,0,1,-1};
int dc[] = {1,-1,0,0};
int w, h;
vector<string> map;

void changeDirection(char sign, int *dirR, int *dirC){
    if (sign == 'S')
        return;
    
    int oldDirR = *dirR;
    int oldDirC = *dirC;
    
    if((oldDirC == 0 && sign == 'L') || (oldDirR == 0 && sign == 'R')) {
        *dirR = oldDirC;
        *dirC = oldDirR;
    } else {
        *dirR = -oldDirC;
        *dirC = -oldDirR;
    }
}

int dfs(int r, int c, int dirR, int dirC, int len){
    if (visit[r][c][dirR][dirC])
        return len;
    visit[r][c][dirR][dirC] = true;
    
    changeDirection(map[r][c], &dirR, &dirC);
    int nr = (r + dirR + h) % h;
    int nc = (c + dirC + w) % w;
    
    return dfs(nr,nc,dirR,dirC,len+1);
}

vector<int> solution(vector<string> grid) {
    vector<int> answer;
    h = grid.size();
    w = grid[0].length();
    map = grid;
    
    for(int r = 0 ; r < h ; r++){
        for(int c = 0 ; c < w ; c++){
            for(int d = 0 ; d < 4 ; d++){
                int len = dfs(r,c,dr[d],dc[d],0);
                if(len != 0)
                    answer.push_back(len);
            }
        }
    }
    sort(answer.begin(), answer.end());
    return answer;
}
