#ifndef BUFFER_H_INCLUDED
#define BUFFER_H_INCLUDED
#include <iostream>

using namespace std;

class Buffer{
    public:
    Buffer(){
        cout << "Konstruktor Buffer" << endl;
    }
    ~Buffer(){
        cout << "Destruktor Buffer" << endl;
    }
    virtual void add(int a)=0;
    virtual void write()=0;
};

#endif // BUFFER_H_INCLUDED
