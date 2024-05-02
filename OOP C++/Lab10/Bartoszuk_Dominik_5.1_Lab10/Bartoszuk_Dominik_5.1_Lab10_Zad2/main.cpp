#include <iostream>
#include <regex>

using namespace std;

int main()
{
    cout << "Hello world!" << endl;

    string godz;
    cout << "Prosze podac godzine: ";
    cin >> godz;
    cout << endl;

    regex wyrazenie("([0-2][0-9]):([0-5][0-9])(:([0-5][0-9]))?");

    if(regex_search(godz, wyrazenie)){
        if(regex_search(godz, regex("2[5-9]"))){
            cout << godz << " to nie jest poprawny zapis godziny" << endl;
        }
        else{
            cout << "Podano poprawna godzine " << godz << endl;
        }
    }
    else{
        cout << godz << " to nie jest poprawny zapis godziny" << endl;
    }

    return 0;
}
