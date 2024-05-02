#include <iostream>
#include <vector>
#include <algorithm>
#include "car.h"

using namespace std;

void wyswietl(vector<Car> v);

int main()
{
    cout << "Hello world!" << endl;

    vector<Car> vect;

    vect.push_back(Car("Toyota", 2019, 2500));
    vect.push_back(Car("Multipla", 2005, 1970));
    vect.push_back(Car("Maluch", 1999, 430));
    vect.push_back(Car("Fiat", 2013, 2000));

    wyswietl(vect);

    sort(vect.begin(), vect.end(), [](Car el1, Car el2){
         return el1.getRok() < el2.getRok();
    });

    wyswietl(vect);

    sort(vect.begin(), vect.end(), [](Car el1, Car el2){
         return el1.getPojemnosc() > el2.getPojemnosc();
    });

    wyswietl(vect);

    return 0;
}

void wyswietl(vector<Car> v){
    int licznik = 1;
    cout << "Oto wszystkie samochody:" << endl;
    for_each(v.begin(), v.end(), [&licznik](Car el){
             cout << licznik << ".\t";
             el.info();
             licznik++;
    });
}
