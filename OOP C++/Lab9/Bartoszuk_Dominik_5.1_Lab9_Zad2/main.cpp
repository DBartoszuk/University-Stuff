#include <iostream>
#include <limits>

using namespace std;

int main()
{
    cout << "Hello world!" << endl;
    cout << "Podawaj dodatnie liczby calkowite" << endl;

    int suma = 0, liczba, proby=0;
    do{
        try{
            proby++;
            cin >> liczba;
            if(cin.fail()) {
                cin.clear();
                cin.ignore(numeric_limits<streamsize>::max(), '\n');
                throw invalid_argument("Invalid input");
            }
            if(liczba <= 0) cout << "DODATNIE" << endl;
            else{
                suma += liczba;
                if(suma > 21){
                    cout << "Za duzo, sprobuj ponownie" << endl;
                    throw -1;
                }
            }
        }
        catch(invalid_argument& ex){
            cout << "Podaj dodatnia liczbe calkowita" << endl;
        }
        catch(int ex){
            suma -= liczba;
        }
    }while(suma != 21);

    cout << "Gratulacje, udalo Ci sie zsumowac 21!" << endl;
    cout << "Zajelo Ci to " << proby << " prob!" << endl;

    return 0;
}
