#include <iostream>
#include <regex>

using namespace std;

int main()
{
    cout << "Hello world!" << endl;

    regex ulica("([a-zA-Z]+\\s?)+");
    regex kodPocztowy("[0-9]{2}-[0-9]{3}");
    regex nrMieszkania("[0-9]+");

    string test;

    cout << "Podaj nazwe ulicy: ";
    getline(cin, test);
    cout << endl;

    if(regex_match(test, ulica)) cout << "Dobra ulica" << endl;
    else cout << "Zla ulica" << endl;

    cout << "Podaj kod pocztowy: ";
    cin >> test;
    cout << endl;
    cin.clear();
    cin.ignore();

    if(regex_match(test, kodPocztowy)) cout << "Dobry kod" << endl;
    else cout << "Zly kod" << endl;

    cout << "Podaj nr mieszkania: ";
    cin >> test;
    cout << endl;
    cin.clear();
    cin.ignore();

    if(regex_match(test, nrMieszkania)) cout << "Dobry nr" << endl;
    else cout << "Zly nr" << endl;

    return 0;
}
