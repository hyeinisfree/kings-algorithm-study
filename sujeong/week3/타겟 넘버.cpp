#include <string>
#include <vector>

using namespace std;

int count = 0;
int result = 0;
int globalTarget;
vector<int> globalNumbers;

void dfs(int sum, int i){
    if(i == globalNumbers.size()-1){
        if(sum == globalTarget)
            count++;
        return;
    }
    dfs(sum + globalNumbers[i+1], i+1);
    dfs(sum - globalNumbers[i+1], i+1);
}

int solution(vector<int> numbers, int target) {
    globalNumbers = {numbers.begin(), numbers.end()};
    globalTarget = target;
    
    dfs(numbers[0], 0);
    dfs(-numbers[0], 0);
    return count;
}
