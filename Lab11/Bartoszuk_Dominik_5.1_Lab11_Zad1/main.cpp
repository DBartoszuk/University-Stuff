#include <iostream>
#include "buffer.h"
#include "bufferarr.h"
#include "bufferfile.h"
#include "vector"

using namespace std;

int main()
{
    cout << "Hello world!" << endl;

    vector<shared_ptr<Buffer>> bufory;
    shared_ptr<Buffer> ba(new BufferArr(5));
    shared_ptr<Buffer> bf (new BufferFile("buffer_test.txt"));
    bufory.push_back(ba);
    bufory.push_back(bf);
    bufory.push_back(ba);
    bufory.push_back(bf);
    bufory.push_back(ba);
    bufory.push_back(bf);

    cout << "Add: " << endl;
    for(int i = 0; i <= 4; i++){
        for(shared_ptr<Buffer> b: bufory){
            b->add(i);
        }
    }
    cout << "Write: " << endl;
    for(int i = 0; i <= 4; i++){
        for(shared_ptr<Buffer> b: bufory){
            b->write();
        }
    }

    return 0;
}
