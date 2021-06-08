#include <iostream>

using namespace std;

int main()
{
    srand(1983);
    int value[9];
    string s = "gssw#tpcz";
    for(int i = 0; i < 9; i++)
    {
        value[i] = (int)rand() % 5 +1;
        s[i] -= value[i];
    }
    cout << s << endl;
    return 0;
}