import Foundation
//Self tak pisany identyfikuje klase, self identyfikuje obiekt
//18.01.24 kolos
//21.12.23 mozliwe, ze wolne
print("Hello, World!")

//Zad1

//func losujLiczbe() -> (Int, Int, Int) {
//    return (Int.random(in: 1..<251), Int.random(in: 1..<251), Int.random(in: 1..<251))
//}
//
//func znajdzNajwieksza(k: (Int, Int, Int)) -> Int{
//    var max = k.0
//    if(k.1 > max){max = k.1}
//    if(k.2 > max){max = k.2}
//    return max
//}
//
//func znajdzNajmniejsza(k: (Int, Int, Int)) -> Int{
//    var min = k.0
//    if(k.1 < min){min = k.1}
//    if(k.2 < min){min = k.2}
//    return min
//}
//
//func znajdzMinMax(k: (Int, Int, Int)) -> (Int, Int){
//    var max = k.0
//    if(k.1 > max){max = k.1}
//    if(k.2 > max){max = k.2}
//    var min = k.0
//    if(k.1 < min){min = k.1}
//    if(k.2 < min){min = k.2}
//    return (min, max)
//}
//
//var krotka = losujLiczbe()
//var minMax = znajdzMinMax(k: krotka)
//
//print("Wygenerowane liczby to \(krotka.0), \(krotka.1), \(krotka.2)")
//print("Najwieksza to \(znajdzNajwieksza(k: krotka))")
//print("Najmniejsza to \(znajdzNajmniejsza(k: krotka))")
//print("Czyli max: \(minMax.1), a min: \(minMax.0)")

//Zad2

//func dodawanie()-> Double{
//    var x=1.0, y=1.0
//    var warunek = true
//    repeat{
//        print("Podaj skladnik: ")
//        if let a = Double(readLine()!){
//            x = a
//            warunek = false
//        }
//    }while(warunek)
//    warunek = true
//    repeat{
//        print("Podaj drugi skladnik: ")
//        if let a = Double(readLine()!){
//            y = a
//            warunek = false
//        }
//    }while(warunek)
//    return x+y
//}
//
//func odejmowanie()-> Double{
//    var x=1.0, y=1.0
//    var warunek = true
//    repeat{
//        print("Podaj odjemna: ")
//        if let a = Double(readLine()!){
//            x = a
//            warunek = false
//        }
//    }while(warunek)
//    warunek = true
//    repeat{
//        print("Podaj odjemnik: ")
//        if let a = Double(readLine()!){
//            y = a
//            warunek = false
//        }
//    }while(warunek)
//    return x-y
//}
//
//func mnozenie()-> Double{
//    var x=1.0, y=1.0
//    var warunek = true
//    repeat{
//        print("Podaj czynnik: ")
//        if let a = Double(readLine()!){
//            x = a
//            warunek = false
//        }
//    }while(warunek)
//    warunek = true
//    repeat{
//        print("Podaj drugi czynnik: ")
//        if let a = Double(readLine()!){
//            y = a
//            warunek = false
//        }
//    }while(warunek)
//    return x*y
//}
//
//func dzielenie()-> Double{
//    var x=1.0, y=1.0
//    var warunek = true
//    repeat{
//        print("Podaj dzielna: ")
//        if let a = Double(readLine()!){
//            x = a
//            warunek = false
//        }
//    }while(warunek)
//    warunek = true
//    repeat{
//        print("Podaj dzielnik: ")
//        if let a = Double(readLine()!), a != 0{
//            y = a
//            warunek = false
//        }
//    }while(warunek)
//    return x/y
//}
//
//func pierwiastek()-> Double{
//    var x=1.0
//    var warunek = true
//    repeat{
//        print("Podaj liczbe do zpierwiastkowania: ")
//        if let a = Double(readLine()!), a>0{
//            x = a
//            warunek = false
//        }
//    }while(warunek)
//    return pow(x, 0.5)
//}
//
//var wybor = 0
//var warunek = true
//print("Wybierz:\n\t1)\t-Dodawanie\n\t2)\t-Odejmowanie\n\t3)\t-Mnozenie\n\t4)\t-Dzielenie\n\t5)\t-Pierwiastkowanie")
//repeat{
//    if let x = Int(readLine()!), x>0, x<6{
//        wybor = x
//        warunek = false
//    }
//    else{
//        print("Zly wybor")
//    }
//}while(warunek)
//switch(wybor){
//    case 1:
//        print("Wybrano: Dodawanie")
//        print("Suma wynosi: \(dodawanie())")
//    case 2:
//        print("Wybrano: Odejmowanie")
//        print("Roznica wynosi \(odejmowanie())")
//    case 3:
//        print("Wybrano: Mnozenie")
//        print("Iloczyn wynosi \(mnozenie())")
//    case 4:
//        print("Wybrano: Dzielenie")
//        print("Iloraz wynosi \(dzielenie())")
//    case 5:
//        print("Wybrano: Pierwiastkowanie")
//        print("Pierwiastek wynosi \(pierwiastek())")
//    default:
//        print("Co?")
//}

//Zad3

//func wczytaj()->(Int, Int){
//    var x=0, y=0
//    var warunek=true
//    repeat{
//        print("Podaj wspolrzedna x: ")
//        if let a = Int(readLine()!){
//            x = a
//            warunek = false
//        }
//    }while(warunek)
//    warunek = true
//    repeat{
//        print("Podaj wspolrzedna y: ")
//        if let a = Int(readLine()!){
//            y = a
//            warunek = false
//        }
//    }while(warunek)
//    return (x, y)
//}
//
//func odleglosc(p1: (Int, Int), p2: (Int, Int))->Double{
//    let a = Double(abs(p1.0 - p2.0))
//    let b = Double(abs(p1.1 - p2.1))
//    return pow(Double(pow(a, 2) + pow(b, 2)), 0.5)
//}
//
//func ktoraCwiartka(p: (Int, Int))->Int{
//    if(p.0 > 0 && p.1 > 0){return 1}
//    if(p.0 < 0 && p.1 > 0){return 2}
//    if(p.0 < 0 && p.1 < 0){return 3}
//    if(p.0 > 0 && p.1 < 0){return 4}
//    return 0
//}
//
//func sprawdzKwadrat(p: (Int, Int)){
//    var wierzcholek = 0
//    var warunek = true
//    repeat{
//        print("Podaj wspolrzedna wierzcholka kwadratu: ")
//        if let a = Int(readLine()!){
//            wierzcholek = a
//            warunek = false
//        }
//    }while(warunek)
//    if(abs(p.0) < abs(wierzcholek) && abs(p.1) < abs(wierzcholek)){
//        print("Punkt \(p) lezy wewnatrz kwadratu")
//    }
//    else if((abs(p.0) == abs(wierzcholek) && abs(p.1) < abs(wierzcholek)) || (abs(p.1) == abs(wierzcholek) && abs(p.0) < abs(wierzcholek))){
//        print("Punkt \(p) lezy na obwodzie kwadratu")
//    }
//    else{
//        print("Punkt \(p) lezy poza kwadratem")
//    }
//    
//}
//
//print("Prosze wczytac 2 punkty")
//var p1 = wczytaj(), p2 = wczytaj()
//print("Odleglosc miedzy tymi punktami wynosi \(String(format: "%.2f", odleglosc(p1: p1, p2: p2)))")
//var cwiartka: Int
//cwiartka = ktoraCwiartka(p: p1)
//if(cwiartka != 0){print("Punkt \(p1) lezy w \(cwiartka) cwiartce")}
//else{print("Punkt \(p1) lezy na osi")}
//cwiartka = ktoraCwiartka(p: p2)
//if(cwiartka != 0){print("Punkt \(p2) lezy w \(cwiartka) cwiartce")}
//else{print("Punkt \(p2) lezy na osi")}
//sprawdzKwadrat(p: p1)
//sprawdzKwadrat(p: p2)

//Zad4

func stworzTablice(l: Int)->[Int]{
    print("Prosze podac \(n) elementow tablicy")
    var tab: [Int] = []
    
    for i in 1...n{
        var warunek = true
        repeat{
            print("Element #\(i):")
            if let a = Int(readLine()!){
                tab.append(a)
                warunek = false
            }
        }while warunek
    }
    return tab
}

func wyswietlTab(arr: [Int]){
    print("Zawartosc tablicy")
    for e in arr{
        print(e, terminator: " ")
    }
    print()
}

func znajdzMax(arr: [Int])->(Int, Int){
    var tabMax: Int = arr[0], maxIndex=0
    for i in 1..<arr.count{
        if(tabMax < arr[i]){
            maxIndex = i
            tabMax = arr[i]
        }
    }
    return (tabMax, maxIndex)
}

func znajdzMin(arr: [Int])->(Int, Int){
    var tabMin: Int = arr[0], minIndex=0
    for i in 1..<arr.count{
        if(tabMin > arr[i]){
            minIndex = i
            tabMin = arr[i]
        }
    }
    return (tabMin, minIndex)
}

func zamiana(arr: inout [Int], t1: (Int, Int), t2: (Int, Int)){
    let pom = t1.0
    arr[t1.1] = t2.0
    arr[t2.1] = pom
}

func sredniaGeometryczna(arr: [Int])->Double{
    var iloczyn: Double = 1
    for el in arr{
        if(el<0){
            iloczyn *= (-1)*Double(el)
        }
        else{
            iloczyn *= Double(el)
        }
    }
    return pow(iloczyn, (1/Double(arr.count)))
}

var n = 0
var warunek = true
repeat{
    print("Prosze podac ilosc elementow tablicy:")
    if let a = Int(readLine()!), a>0{
        n = a
        warunek = false
    }
}while warunek

var tab: [Int] = stworzTablice(l: n)

wyswietlTab(arr: tab)

var suma=0, t1=znajdzMax(arr: tab), t2=znajdzMin(arr: tab)
for el in tab{
    suma += el
}

print("Najmniejszy element: \(t2.0) pod indeksem \(t2.1)")
print("Najwiekszy element: \(t1.0) pod indeksem \(t1.1)")
print("Srednia arytmetyczna: \(Double(suma)/Double(tab.count))")
zamiana(arr: &tab, t1: t1, t2: t2)
wyswietlTab(arr: tab)
print("Srednia geometryczna: \(sredniaGeometryczna(arr: tab))")

//Zad5
class Osoba{
    var imie, nazwisko: String
    var rokUr: Int
    init(i: String, n: String, r: Int){
        self.imie = i
        self.nazwisko = n
        self.rokUr = r
    }
}

func obliczWiek(osoba: Osoba)->Int{
    return 2024-osoba.rokUr
}

func wyswietlOsobe(osoba: Osoba){
    print("\(osoba.imie) \(osoba.nazwisko), urodz. \(osoba.rokUr)")
}

var o1 = Osoba(i: "Kamil", n: "Nowak", r: 2002)
var o2 = Osoba(i: "Janina", n: "Kowalska", r: 1972)
var o3 = Osoba(i: "Jan", n: "Rodrigez", r: 2002)
wyswietlOsobe(osoba: o1)
wyswietlOsobe(osoba: o2)
wyswietlOsobe(osoba: o3)
if(obliczWiek(osoba: o1) == obliczWiek(osoba: o2)){
    print("Te osoby maja taki sam wiek")
}
else if(obliczWiek(osoba: o1) > obliczWiek(osoba: o2)){
    print("Pierwsza osoba jest starsza")
}
else{
    print("Pierwsza osoba jest mlodsza")
}
//Zad6
import Foundation
class Osoba{
    var imie, nazwisko: String
    var rokUr: Int
    init(i: String, n: String, r: Int){
        self.imie = i
        self.nazwisko = n
        self.rokUr = r
    }
    func wyswietl(){
        print("\(imie) \(nazwisko), urodz. \(rokUr)")
    }
}

class Pracownik: Osoba{
    var rokZat, liczbaZrealizowanychGodzin: Int
    var stanowisko, nazwaFirmy: String
    var stawka: Double
    
    init(i: String, n: String, r: Int, rz: Int, lzg: Int, s: String, nf: String, st: Double) {
        self.rokZat = rz
        self.liczbaZrealizowanychGodzin = lzg
        self.stanowisko = s
        self.nazwaFirmy = nf
        self.stawka = st
        super.init(i: i, n: n, r: r)  // Wywołanie init z klasy Osoba
    }
    
    func liczbaLat()->Int{
        return 2024-rokZat
    }
    func pensja()->Double{
        return Double(liczbaZrealizowanychGodzin)*stawka
    }
    override func wyswietl(){
        print("\(imie) \(nazwisko), ur. \(rokUr)")
        print("Pracownik \(nazwaFirmy) od \(rokZat) na stanowisku \(stanowisko)")
        print("Stawka: \(stawka), Liczba zrealizowanych godzin: \(liczbaZrealizowanychGodzin)")
    }
}

var p1 = Pracownik(i: "Janina", n: "Kanina", r: 1987, rz: 2008, lzg: 1590, s: "Wozna", nf: "Firma", st: 0.99)
p1.wyswietl()