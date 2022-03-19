#include <string>
#include <vector>
#include <algorithm>

using namespace std;

vector<string> possibleCourses;

bool checkOrder(const string & order, const string & course) {
    for (const char & menu : course) {
        if (order.find(menu) == -1) {
            return false;
        }
    }
    
    return true;
}

bool checkExistance(const vector<string> answer, const string possibleCourse) {
    for (const string & str : answer) {
        if (str == possibleCourse) {
            return true;
        }
    }
    
    return false;
}

void findAllPossibleCourses(const string & order, string & picked, int toPick) {
    if (toPick == 0) {
        if (!checkExistance(possibleCourses, picked)) {
            possibleCourses.push_back(picked);
        }
        
        return;
    }
    
    int menuIndex = picked.empty() ? 0 : order.find(picked.back()) + 1;
    int orderSize = order.size();
    
    for (int nextMenuIndex = menuIndex; nextMenuIndex < orderSize; nextMenuIndex++) {
        picked += order.at(nextMenuIndex);
        findAllPossibleCourses(order, picked, toPick - 1);
        picked.pop_back();
    }
}

int findMaxCount(const vector<string> orders) {
    int maxCount = 0;
    
    for (string & possibleCourse : possibleCourses) {
        int count = 0;
        
        for (const string & order : orders) {
            if (checkOrder(order, possibleCourse)) {
                count++;
            }
        }
        
        if (count > maxCount) {
            maxCount = count;
        }
    }
    
    return maxCount;
}

vector<string> solution(vector<string> orders, vector<int> course) {
    vector<string> answer;
    string picked = "";
    
    for (string & order : orders) {
        sort(order.begin(), order.end());
    }
    
    for (int & numberOfMenus : course) {
        possibleCourses.clear();
        
        for (string & order : orders) {
            picked.clear();
            
            findAllPossibleCourses(order, picked, numberOfMenus);
        }
       
        int maxCount = findMaxCount(orders);
        
        if (maxCount < 2) {
            continue;
        }
        
        for (string & possibleCourse : possibleCourses) {
            int count = 0;
            
            for (const string & order : orders) {
                if (checkOrder(order, possibleCourse)) {
                    count++;
                }
            }
            
            if (count == maxCount) {
                answer.push_back(possibleCourse);
            }
        }
    }
    
    sort(answer.begin(), answer.end());
    
    return answer;
}
