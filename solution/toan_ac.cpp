#include <iostream>
#include <stdio.h>

using namespace std;

int main(int argc, char* argv[])
{
	freopen(argv[1], "r", stdin);
    int n;
    cin >> n;
    if ((n%2==0) && (n>2)) cout << "YES"; else cout << "NO";
    return 0;
}