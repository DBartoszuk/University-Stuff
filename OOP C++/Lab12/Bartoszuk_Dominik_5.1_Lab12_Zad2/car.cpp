#include "car.h"
#include <iostream>

using namespace std;

Car::Car(string model, int rok, float pojemnosc){
    this->model = model;
    this->rok = rok;
    this->pojemnosc = pojemnosc;
}

string Car::getModel(){
    return model;
}
int Car::getRok(){
    return rok;
}
float Car::getPojemnosc(){
    return pojemnosc;
}

void Car::setModel(string model){
    this->model = model;
}
void Car::setRok(int rok){
    this->rok = rok;
}
void Car::setPojemnosc(float pojemnosc){
    this->pojemnosc = pojemnosc;
}

void Car::info(){
    cout << "Model auta: " << getModel() << ", rok: " << getRok() << ", pojemnosc: " << getPojemnosc() << endl;
}
