#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void print(vector<int> v);
void sr_aryt(vector<int> v);
int ilosc_parzystych(vector<int> v);
void usun_ujemne(vector<int> v);
void sort_parzystosc(vector<int> v);
void zamianka(vector<int> v);
int ile_mniejszych(vector<int> v, int n);

int main()
{
    cout << "Hello world!" << endl;

    vector<int> vect = {-124, 0 , 13, 2345, 54, -200, -56, 340, -3, 4};
    print(vect);
    cout << endl;
    sr_aryt(vect);
    cout << endl;
    cout << "Ilosc elementow parzystych w wektorze: " << ilosc_parzystych(vect) << endl;
    cout << endl;
    cout << "Wektor bez elementow ujemnych:" << endl;
    usun_ujemne(vect);
    cout << endl;
    cout << "Wektor posortowany tak, aby na pocz¹tku by³y elementy parzyste:" << endl;
    sort_parzystosc(vect);
    cout << "Zanegowane elementy:" << endl;
    zamianka(vect);
    cout << "Ilosc elementow mniejszych niz 24: " << ile_mniejszych(vect, 24) << endl;

    return 0;
}

void print(vector<int> v){
    cout << "| ";
    for_each(v.begin(), v.end(), [](int el){
             cout << el << " | ";
    });
    cout << endl;
}

void sr_aryt(vector<int> v){
    float suma=0, ilosc=0;
    for_each(v.begin(), v.end(), [&suma, &ilosc](int el){
             suma += (float)el;
             ilosc++;
    });
    cout << "Srednia arytmetyczna: " << suma/ilosc << endl;
}

int ilosc_parzystych(vector<int> v){
    int ilosc=0;
    for_each(v.begin(), v.end(), [&ilosc](int el){
             if(el%2 == 0) ilosc++;
    });
    return ilosc;
}

void usun_ujemne(vector<int> v){
    v.erase(remove_if(v.begin(), v.end(), [](int el){
        return el < 0;
    }), v.end());
    print(v);
}

void sort_parzystosc(vector<int> v){
    partition(v.begin(), v.end(), [](int el){
         return (el%2 == 0);
    });
    print(v);
}

void zamianka(vector<int> v){
    for_each(v.begin(), v.end(), [&v](int el){
             v.at(find(v.begin(), v.end(), el) - v.begin()) *= -1;  //znajdŸ iterator danego elementu, odejmuj¹c pocz¹tek znajdujemy index, za pomoc¹ at dostêp do elementu i potem mo¿na modyfikowaæ go
    }); //ewentualnie transform
    print(v);
}

int ile_mniejszych(vector<int> v, int n){
    int ilosc = 0;
    for_each(v.begin(), v.end(), [&ilosc, n](int el){
             if(el < n) ilosc++;
    });
    return ilosc;
}
