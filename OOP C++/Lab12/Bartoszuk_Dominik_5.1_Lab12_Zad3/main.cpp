#include <iostream>
#include <vector>
#include <algorithm>
#include <tuple>

using namespace std;

tuple<int, int, string> funkcja(vector<string> v);

int main()
{
    cout << "Hello world!" << endl;

    vector<string> vect;
    vect.push_back("Ala ma kota");
    vect.push_back("Kot ma ale");
    vect.push_back("DB");
    vect.push_back("Linux jest the best ;)");
    vect.push_back("Student");

    tuple<int, int, string> t = funkcja(vect);
    cout << get<0>(t) << " " << get<1>(t) << " " << get<2>(t);

    return 0;
}

tuple<int, int, string> funkcja(vector<string> v){
    int dl_min=v.front().length(), suma = 0, ilosc = 0;
    string napis_max="";
    for_each(v.begin(), v.end(), [&dl_min, &suma, &ilosc, &napis_max](string el){
        if(dl_min > el.length()) dl_min = el.length();
        if(napis_max.length() < el.length()) napis_max = el;
        suma += el.length();
        ilosc++;
    });

    return make_tuple(dl_min, (suma/ilosc), napis_max);
}
