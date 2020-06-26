#include <iostream>
#include <stdio.h>

using namespace std;

int main(int argc, char* argv[])
{
	freopen(argv[1], "r", stdin);
    int n;
    cin >> n;
    if (n%2==1) cout << "NO"; else cout << "YES";
    return 0;
}