#include <string>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> db[3][2][2][2];

vector<int> splitInfoString(const string & str) {
    vector<int> result;
    
    int strSize = str.size();
    string temp = "";
    int entry;
    
    for (int i = 0; i < strSize; i++) {
        if (str[i] == ' ') {
            if (temp == "cpp" || temp == "backend" || temp == "junior" || temp == "chicken") {
                entry = 0;
            } else if (temp == "python") {
                entry = 2;
            } else {
                entry = 1;
            }
            
            result.push_back(entry);
            temp.clear(); 
            
            continue;
        }
        
        temp += str[i];
    }
    
    result.push_back(stoi(temp));
    
    return result;
}

vector<string> splitString(const string & str) {
    int strSize = int(str.size());
    
    vector<string> result;
    string temp = "";
    
    for (int i = 0; i < strSize; i++) {
        if (str[i] == ' ') {
            if (!temp.empty() && temp != "and") {
                result.push_back(temp);
            }
            
            temp.clear();
            
            continue;
        }
        
        temp += str[i];
    }
    
    result.push_back(temp);
    
    return result;
}

vector<int> solution(vector<string> info, vector<string> query) {
    vector<int> answer;
    
    int infoSize = int(info.size());
    int querySize = int(query.size());
    
    vector<vector<string>> applicants;
    vector<vector<string>> queries;
    
    vector<int> temp;
    for (string str : info) {
        temp.clear();
        temp = splitInfoString(str);

        db[temp[0]][temp[1]][temp[2]][temp[3]].push_back(temp[4]);
    }
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 2; j++) {
            for (int k = 0; k < 2; k++) {
                for (int l = 0; l < 2; l++) {
                    sort(db[i][j][k][l].begin(), db[i][j][k][l].end());
                }
            }
        }
    }
    
    for (int i = 0; i < querySize; i++) {
        queries.push_back(splitString(query[i]));
    }
    
    int is, ie, js, je, ks, ke, ls, le;
    
    for (vector<string> q : queries) {
        if (q[0] == "cpp") is = ie = 0;
        else if (q[0] == "java") is = ie = 1;
        else if (q[0] == "python") is = ie = 2;
        else { is = 0; ie = 2; }
        
        if (q[1] == "backend") js = je = 0;
        else if (q[1] == "frontend") js = je = 1;
        else { js = 0; je = 1; }
    
        if (q[2] == "junior") ks = ke = 0;
        else if (q[2] == "senior") ks = ke = 1;
        else { ks = 0; ke = 1; }

        if (q[3] == "chicken") ls = le = 0;
        else if (q[3] == "pizza") ls = le = 1;
        else { ls = 0; le = 1; }
        
        int count = 0;
        int minScore = stoi(q.back());
        
        for (int i = is; i <= ie; i++) {
            for (int j = js; j <= je; j++) {
                for (int k = ks; k <= ke; k++) {
                    for (int l = ls; l <= le; l++) {
                        for (int score : db[i][j][k][l]) {
                            if (score >= minScore) {
                                count++;
                            }
                        }
                    }
                }
            }
        }
        
        answer.push_back(count);
    }
    
    return answer;
}
