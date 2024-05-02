#ifndef BUFFERARR_H_INCLUDED
#define BUFFERARR_H_INCLUDED
#include "buffer.h"
#include <iostream>

using namespace std;

class BufferArr: public Buffer{
private:
    int* tab;
    int indeks = 0, rozmiar;
public:
    BufferArr(int n){
        cout << "Konstruktor BufferArr" << endl;
        tab=new int[n];
        rozmiar = n;
    }

    ~BufferArr(){
        cout << "Destruktor BufferArr" << endl;
        delete [] tab;
    }

    virtual void add(int a) override{
        if(indeks < rozmiar){
            tab[indeks] = a;
            indeks++;
        }
        else{
            cout << "Tablica jest juz pelna" << endl;
        }
    }
    virtual void write() override{
        for(int i=0; i<indeks; i++){
            cout << tab[i] << " ";
        }
        cout << endl;
    }
    void setIndeks(int i){
        indeks = i;
    }
    int getIndeks(){
        return indeks;
    }
    void setRozmiar(int r){
        rozmiar = r;
    }
    int getRozmiar(){
        return rozmiar;
    }
};

#endif // BUFFERARR_H_INCLUDED
