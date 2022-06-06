//
//  DFS와 BFS.cpp
//  kings-algorithm-project
//
//  Created by 임수정 on 2022/06/05.
//

#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;

void dfs(int start, const vector<int> graph[], bool visit[]){

    visit[start] = true;
    cout << start << " ";
    
    for(int i = 0 ; i < graph[start].size() ; i++){
        if(!visit[graph[start][i]])
            dfs(graph[start][i], graph, visit);
    }
}

void bfs(int start, const vector<int> graph[], int n){
    bool visitt[n+1];
    for(int i = 1 ; i <= n ; i++){
        visitt[i] = false;
    }
    queue<int> q;
    q.push(start);
    visitt[start] = true;
    
    while(!q.empty()){
        int node = q.front();
        q.pop();
        cout << node << " ";
        
        for(int i = 0 ; i < graph[node].size(); i++){
            if(!visitt[graph[node][i]]){
                q.push(graph[node][i]);
                visitt[graph[node][i]] = true;
            }
        }
    }
}

int main(){
    int n, m, v;
    cin >> n >> m >> v;
    
    bool visit[n+1];
    for(int i = 0 ; i <= n ; i++)
        visit[i] = false;
    
    vector<int> graph[n+1];
    
    for(int i = 0 ; i < m ; i++){
        int a,b;
        cin >> a >> b;
        graph[a].push_back(b);
        graph[b].push_back(a);
    }
    
    for(int i = 1 ; i <= n ; i++){
        sort(graph[i].begin(), graph[i].end());
    }
    
    dfs(v, graph, visit);
    cout << endl;
    bfs(v, graph, n);
    return 0;
}
