
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

const int MAX = 500 + 5;

typedef struct
{
	int y, x;
} Dir;

Dir moveDir[4] = { { -1, 0 },{ 0, -1 },{ 1, 0 },{ 0, 1 } }; // UP, LEFT, DOWN, RIGHT

bool visited[MAX][MAX][4];

int getCycleLength(int y, int x, int dir, vector<string> &grid)
{
	int len = 0;

	while (1)
	{
		if (visited[y][x][dir])
		{
			break;
		}

		visited[y][x][dir] = true;
		len++;

		if (grid[y][x] == 'L')
		{
			dir = dir ? dir - 1 : 3;
		}
		else if (grid[y][x] == 'R')
		{
			dir = dir == 3 ? 0 : dir + 1;
		}

		y = (y + moveDir[dir].y + grid.size()) % grid.size();
		x = (x + moveDir[dir].x + grid[0].size()) % grid[0].size();
	}

	return len;
}

vector<int> solution(vector<string> grid) {
	vector<int> answer;

	for (int y = 0; y < grid.size(); y++)
	{
		for (int x = 0; x < grid[0].size(); x++)
		{
			for (int k = 0; k < 4; k++)
			{
				if (visited[y][x][k])
				{
					continue;
				}

				answer.push_back(getCycleLength(y, x, k, grid));
			}
		}
	}

	sort(answer.begin(), answer.end());

	return answer;
}
