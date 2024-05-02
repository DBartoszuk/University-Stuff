#include <iostream>
#include <regex>

using namespace std;

int main()
{
    cout << "Hello world!" << endl;

    string tekst;
    cout << "Prosze cos napisac: ";
    cin >> tekst;
    cout << endl;
    if(regex_search(tekst, regex("[0-9]+\\.[0-9]+"))){
        cout << "Ciag zawieral liczbe zmiennoprzecinkowa" << endl;
    }
    else{
        cout << "Ciag nie zawieral liczby zmiennoprzecinkowej" << endl;
    }

    return 0;
}
