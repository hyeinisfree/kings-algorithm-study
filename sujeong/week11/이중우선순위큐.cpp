#include <string>
#include <vector>
#include <queue>
#include <sstream>
#include <iostream>

using namespace std;

vector<int> solution(vector<string> operations) {
    vector<int> answer;
    
    priority_queue<int, vector<int>, greater<int>> minHeap;
    priority_queue<int, vector<int>, less<int>> maxHeap;
    
    int cnt = 0;
    
    for(int i = 0 ; i < operations.size() ; i++) {
        if(operations[i][0] == 'I'){
            string num = operations[i].substr(2);
            int number = stoi(num);
            maxHeap.push(number);
            minHeap.push(number);
            cnt++;
        }else {
            if(cnt == 0)
                continue;
            
            if(operations[i] == "D 1" && cnt > 0){
                maxHeap.pop();
                cnt--;
            } else if(operations[i] == "D -1" && cnt > 0) {
                minHeap.pop();
                cnt--;
            }
            
            if(cnt == 0){
                maxHeap = priority_queue<int, vector<int>, less<int>>();
                minHeap = priority_queue<int, vector<int>, greater<int>>();
            }
        }
    }
    
    if(cnt > 0){
        answer.push_back(maxHeap.top());
        answer.push_back(minHeap.top());
    } else {
        answer = {0,0};
    }
    
    
    return answer;
}
