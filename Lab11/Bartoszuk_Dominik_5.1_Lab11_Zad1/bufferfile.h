#ifndef BUFFERFILE_H_INCLUDED
#define BUFFERFILE_H_INCLUDED
#include "buffer.h"
#include <iostream>
#include <fstream>
#include <memory>

using namespace std;

class BufferFile: public Buffer{
private:
    string filepath;
    unique_ptr<ifstream> fileOutput;
    unique_ptr<ofstream> fileInput;
public:
    BufferFile(string sciezka){
        cout << "Konstruktor BufferFile" << endl;
        filepath = sciezka;
        fileInput = make_unique<ofstream>(filepath, ios::out);
    }
    ~BufferFile(){
        cout << "Destruktor BufferFile" << endl;
    }
    virtual void add(int a) override{
        fileInput = make_unique<ofstream>(filepath, ios::app);
        if(!fileInput->is_open()){
            cout << "Nie udalo sie otworzyc pliku" << endl;
        }
        *fileInput << a << "\n";
        fileInput.reset();
    }
    virtual void write() override{
        fileOutput = make_unique<ifstream>(filepath);
        if(!fileOutput->is_open()){
            cout << "Nie udalo sie otworzyc pliku" << endl;
        }
        string linia;
        while(getline(*fileOutput, linia)){
            cout << linia;
        }
        cout << endl;
        fileInput.reset();
    }

    void setFilepath(string s){
        filepath = s;
    }
    string getFilepath(){
        return filepath;
    }
};

#endif // BUFFERFILE_H_INCLUDED
