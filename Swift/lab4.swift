import Foundation

//Zad1
//var ilosc, n1, n2, n3: Int
//
//print("Podaj ilosc elementow ciagu fibbonaciego do wyswietlenia: ")
//ilosc = Int(readLine()!)!
//n1=0
//n2=1
//print("Oto Fibonacci")
//while ilosc > 0{
//    n3 = n1+n2
//    n1 = n2
//    n2 = n3
//    print(n3)
//    ilosc-=1
//}

//KOLOS 23.11

//Zad2
//var liczba, ilosc_dzielnikow, pom: Int
//print("Wczytaj liczbe: ")
//liczba = Int(readLine()!)!
//pom = liczba
//ilosc_dzielnikow = 0
//while pom > 0{
//    if(liczba%pom == 0){ilosc_dzielnikow+=1}
//    pom-=1
//    if(ilosc_dzielnikow>2){break}
//}
//if(ilosc_dzielnikow==2){print("Jest to liczba pierwsza")}
//else{print("Nie jest to liczba pierwsza")}

//Zad3
//var liczba: Int?
//var wynik, pomoc, srednia: Double
//liczba = 0; pomoc = 0; srednia = 1.0
//repeat{
//    print("Podaj liczbe CONAJMNIEJ trzycyfrowa: ")
//    liczba = Int(readLine()!)
//}while(liczba!<100) || (liczba == nil)
//while liczba!>1{
//    srednia *= Double((liczba!)%10)
//    liczba! /= 10
//    pomoc+=1
//}
//wynik = Double(pow(srednia, (1/pomoc)))
//print("Oto wynik: \(wynik)")

//Zad4
//var ciag: String
//var pomoc: Int
//var czyPali: Bool
//print("Podaj ciag znakow: ")
//ciag = readLine()!
//czyPali = true
//pomoc = ciag.count/2
//while pomoc > 0{
//    if(ciag[ciag.index(ciag.startIndex, offsetBy: pomoc)] != ciag[ciag.index(ciag.endIndex, offsetBy: -pomoc-1)]){
//        czyPali = false
//        break
//    }
//    pomoc-=1
//}
//if(!czyPali){print("Ciag \(ciag) NIE jest palindromem")}
//else{print("Ciag \(ciag) jest palindromem")}

//Zad5
var ciag: String
var a, b, c, len, max, min: Int
var warunek: Bool

repeat{
    warunek = false
    print("Podaj ciag liczb calkowitych: ")
    ciag = readLine()!
    len = ciag.count-1
    for i in stride(from: 0, to: len, by: 1){
        a = Int(String(ciag[ciag.index(ciag.startIndex, offsetBy: i)]))!
        b = Int(String(ciag[ciag.index(ciag.startIndex, offsetBy: i+1)]))!
        if(a == b){
            warunek = true
            break
        }
    }
}while warunek

len-=1
max = 0; min = 0
for i in stride(from: 0, to: len, by: 1){
    a = Int(String(ciag[ciag.index(ciag.startIndex, offsetBy: i)]))!
    b = Int(String(ciag[ciag.index(ciag.startIndex, offsetBy: i+1)]))!
    c = Int(String(ciag[ciag.index(ciag.startIndex, offsetBy: i+2)]))!
    if(b > a && b > c){max+=1}
    if(b < a && b < c){min+=1}
}

print("Ilosc maksimow lokalnych: \(max). Ilosc minimow lokalnych: \(min)")
