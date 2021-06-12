#include <iostream>

using namespace std;

int main()
{
    string v6 = "AHi23DEADBEEFCOFFEE";
    string s1 = "";
    s1 += v6[0] ^ 2;
    s1 += v6[3] - 10;
    s1 += v6[2] + 12;
    s1 += v6[2];
    s1 += v6[1] +1;
    for(int i = 5; i <= 18; i++)
        s1 += v6[i] - 1;
    cout << s1 << endl;
    return 0;
}