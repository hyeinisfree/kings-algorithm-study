#include <iostream>
#include <queue>
using namespace std;
int distances[100001];
bool visit[100001];
queue<int> q;

int main(){
    int x,k;
    cin >> x >> k;
    q.push(x);
    visit[x] = true;
    while(!q.empty() && !visit[k]){
        int here = q.front();
        q.pop();
        if(here-1 >= 0 && !visit[here-1] && here-1 <= 100001){
            q.push(here-1);
            visit[here-1] = true;
            distances[here-1] = distances[here] + 1;
        }
        if(!visit[here+1] && here+1 <= 100001){
            q.push(here+1);
            visit[here+1] = true;
            distances[here+1] = distances[here] + 1;
        }
        if(!visit[here*2] && here*2 <= 100001){
            q.push(here*2);
            visit[here*2] = true;
            distances[here*2] = distances[here] + 1;
        }
    }
    cout << distances[k];
    return 0;
}
