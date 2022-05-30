#include <iostream>
using namespace std;

const int MAX = 2500;

// 상, 하, 좌, 우
int xDirection[4] = {0, 0, -1, 1};
int yDirection[4] = {-1, 1, 0, 0};

int graph[MAX][MAX];
bool visited[MAX][MAX];

int width, height;

void reset() {
   for (int i = 0; i < MAX; i++) {
       for (int j = 0; j < MAX; j++) {
           graph[i][j] = 0;
           visited[i][j] = false;
       }
   } 
}

bool checkValidIndex(int x, int y) {
    if ((x >= 0) && (x < height) && (y >= 0) && (y < width)) {
        return true;
    }
    
    return false;
}

void dfs(int startX, int startY) {
    visited[startX][startY] = true;
    
    for (int i = 0; i < 4; i++) {
        int nextX = startX + xDirection[i];
        int nextY = startY + yDirection[i];
        
        if (checkValidIndex(nextX, nextY) && (graph[nextX][nextY] == 1) && !visited[nextX][nextY]) {
            dfs(nextX, nextY);
        }
    }
}

void dfsAll() {
    int result = 0;
    
    for (int x = 0; x < height; x++) {
        for (int y = 0; y < width; y++) {
            if (graph[x][y] == 1 && !visited[x][y]) {
                result += 1;
                dfs(x, y);
            }
        }
    }
    
    cout << result << endl;
}

int main() {
    int numberOfTestCases;
    
    cin >> numberOfTestCases;
    
    int numberOfPositions;
    
    for (int testCase = 0; testCase < numberOfTestCases; testCase++) {
        reset();
        
        cin >> width >> height >> numberOfPositions;
        
        int xPos, yPos;
        
        for (int i = 0; i < numberOfPositions; i++) {
            cin >> xPos >> yPos;
            
            graph[yPos][xPos] = 1;
        }
        
        dfsAll();
    }
    
    return 0;
}
