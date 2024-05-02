#include <iostream>
#include <tuple>
using namespace std;
int main()
{
    tuple <char, int, float> t1;
    t1 = make_tuple('a', 8, 21.5);
    cout << "Liczba elementow: " << tuple_size<decltype(t1)>::value << endl;
    cout <<"get<0>: "<< get <0>(t1) << endl;
    cout <<"get<1>: "<< get <1>(t1) << endl;
    cout <<"get<2>: "<< get <2>(t1) << endl;
    tuple_element<0,decltype(t1)>::type
    first = get<0>(t1);
    tuple_element<1,decltype(t1)>::type
    second = get<1>(t1);
    cout << "Pierwszy element t1: " << first << endl;
    cout << "drugi element t1: " << second << endl;
    cout<<"Przed modyfikacja: get<1>: " <<get<1>(t1)<<endl;
    get<1>(t1)=2;
    cout<<"Po modyfikacji: get<1>: "<<get<1>(t1)<<endl;
    tuple <char,int,float> t2('p',45,7.5);
    cout<<"Przed swap t2"<<endl;
    cout <<"get<0>: "<< get <0>(t2) << endl;
    cout <<"get<1>: "<< get <1>(t2) << endl;
    cout <<"get<2>: "<< get <2>(t2) << endl;
    t2.swap(t1);
    cout<<"Po swap t2"<<endl;
    cout <<"get<0>: "<< get <0>(t2) << endl;
    cout <<"get<1>: "<< get <1>(t2) << endl;
    cout <<"get<2>: "<< get <2>(t2) << endl;
    tuple <int,char> t3(2,'a');
    auto t4=make_tuple(3,'b');
    auto t5 = tuple_cat(t3,t4);
    cout<<"Zawartosc t5: "<<endl;
    cout<<get<0>(t5)<<" "<<get<1>(t5)<<" "<<get<2>(t5) <<" "<<get<3>(t5)<<endl;
    int i_val;
    char ch_val;
    float f_val;
    tuple <int,char,float> t6(2,'R',3.5);
    tie(i_val,ch_val,f_val) = t6;
    cout << "Pobranie wszystkich zmiennych z tupli: ";
    cout << i_val << " " << ch_val << " " << f_val<<endl;
    tie(i_val,ignore,f_val) = t6;
    cout << "Pobranie wybranych zmiennych z tupli: ";
    cout << i_val << " " << f_val<<endl;
    return 0;
}
