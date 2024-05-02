#ifndef CAR_H_INCLUDED
#define CAR_H_INCLUDED

#include <string>
#include <stdlib.h>

using namespace std;

class Car{
private:
    string model;
    int rok;
    float pojemnosc;
public:
    Car(string model, int rok, float pojemnosc);
    string getModel();
    int getRok();
    float getPojemnosc();
    void setModel(string model);
    void setRok(int rok);
    void setPojemnosc(float pojemnosc);
    void info();
};

#endif // CAR_H_INCLUDED
