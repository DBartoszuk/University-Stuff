#include <iostream>
#include <fstream>
#include <limits>

using namespace std;
int main()
{
    cout << "Hello world!" << endl;
    try{
        ifstream fileIf("kod.txt");
        if(!fileIf.is_open()){
            throw -1;
        }
        char a, b;
        string linia;
        while(fileIf.get(a)){
            b= fileIf.peek();
            if(a=='/' && b=='/'){
                fileIf.ignore(numeric_limits<streamsize>::max(), '\n');
                linia += '\n';
            }
            else if(a == '\n'){
                cout << linia << endl;
                linia = "";
            }
            else{
                linia += a;
            }
        }
        fileIf.close();
    }
    catch(int e){
        cerr << "Wystapil blad" << endl;
    }
    return 0;
}
