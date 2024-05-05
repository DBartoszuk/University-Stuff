//
//  main.swift
//  DB_Lab7_Swift
//
//  Created by student on 30/11/2023.
//

import Foundation

print("Hello, World!")

//Zad1
//struct LiczbaZespolona{
//    var rz: Int
//    var ur: Int
//    init(rz: Int, ur: Int) {
//        self.rz = rz
//        self.ur = ur
//    }
//    
//    func dodawanie(czynnik: LiczbaZespolona){
//        let rz2 = self.rz + czynnik.rz
//        let ur2 = self.ur + czynnik.ur
//        
//        print("Suma \(self.rz) \(self.ur)i oraz \(czynnik.rz) \(czynnik.ur)i: ")
//        print("\(rz2) \(ur2)i")
//    }
//    
//    func odejmowanie(odjemna: LiczbaZespolona){
//        let rz2 = self.rz - odjemna.rz
//        let ur2 = self.ur - odjemna.ur
//        
//        print("Roznica \(self.rz) \(self.ur)i oraz \(odjemna.rz) \(odjemna.ur)i: ")
//        print("\(rz2) \(ur2)i")
//    }
//    
//    func mnozenie(czynnik: LiczbaZespolona){
//        let rz2 = (self.rz * czynnik.rz) - (self.ur * czynnik.ur)
//        let ur2 = (self.rz * czynnik.ur) + (self.ur * czynnik.rz)
//        print("Mnozenie \(self.rz) \(self.ur)i oraz \(czynnik.rz) \(czynnik.ur)i: ")
//        print("\(rz2) \(ur2)i")
//    }
//    
//}
//
//var l1 = LiczbaZespolona(rz: Int.random(in: -15...15), ur: Int.random(in: -15...75))
//var l2 = LiczbaZespolona(rz: Int.random(in: -15...15), ur: Int.random(in: -15...75))
//l1.dodawanie(czynnik: l2)
//l1.odejmowanie(odjemna: l2)
//l1.mnozenie(czynnik: l2)

//Zad2

//struct RzutOszczepem{
//    var id: Int
//    var p1, p2, p3: Double
//    
//    init(id: Int, p1: Double, p2: Double, p3: Double) {
//        self.id = id
//        self.p1 = p1
//        self.p2 = p2
//        self.p3 = p3
//    }
//    
//    func obliczSr() -> Double{
//        return (self.p1 + self.p2 + self.p3)/Double(3)
//    }
//}
//
//var zawodnicy: [RzutOszczepem] = []
//for i in 1...3{
//    zawodnicy.append(RzutOszczepem(id: i, p1: Double.random(in: 10...100), p2: Double.random(in: 10...100), p3: Double.random(in: 10...100)))
//}
//var tab: [(srednia: Double, zawodnik: Int)] = []
//for z in zawodnicy{
//    tab.append((z.obliczSr(), z.id))
//}
//
//for i in zawodnicy{
//    print("\(i.id) \(String(format: "%.2f", i.p1)) \(String(format: "%.2f", i.p2)) \(String(format: "%.2f", i.p3))")
//}
//
//tab.sort(by: {$0.srednia > $1.srednia})
//print("Najlepsza srednia uzyskal zawodnik o ID \(tab[0].zawodnik): \(String(format: "%.2f", (tab[0].srednia)))")
//print("Najgorsza srednia uzyskal zawodnik o ID \(tab[2].zawodnik): \(String(format: "%.2f", (tab[2].srednia)))")
//zawodnicy.remove(at: 2)
//
//for i in zawodnicy{
//    print("\(i.id) \(String(format: "%.2f", i.p1)) \(String(format: "%.2f", i.p2)) \(String(format: "%.2f", i.p3))")
//}

//Zad3

//var samochody = Set<String>()
//
//samochody.insert("Pasat")
//samochody.insert("Opel")
//samochody.insert("Volkswagen")
//samochody.insert("Mercedes")
//samochody.insert("Toiota")
//samochody.insert("Tesla")
//
//for s in samochody{
//    print(s)
//}
//print("Podaj samochod do usuniecia: ")
//if let samochod = samochody.remove(readLine()!){
//    print("Usunieto \(samochod)")
//}
//else{
//    print("Nie ma takiego modelu")
//}

//Zad4

// var studenci: [Int: String] = [:]
// for i in 1...5{
//     print("Podaj nazwisko studenta #\(i)")
//     studenci[i] = readLine()!
// }
// for s in studenci{
//     print("Student Id: \(s.key), nazwisko: \(s.value)")
// }
// print("Podaj nazwisko studenta: ")
// var nazw = readLine()!
// if let znaleziony = studenci.first(where: { $0.value == nazw }) {
//     print("Wyszukany student: \(znaleziony.key): \(znaleziony.value)")
// } else {
//     print("Nie znaleziono studenta o nazwisku \(nazw).")
// }
// print("Podaj nazwisko studenta do usuniecia")
// nazw = readLine()!
// if let doUsuniecia = studenci.first(where: {$0.value == nazw}){
//     studenci.removeValue(forKey: doUsuniecia.key)
//     print("Usunięto \(doUsuniecia)")
// }
// else{
//     print("Brakuje elementu do usunicia")
// }

//Zad5

struct Loty: Equatable{
    var wylot: [Int: String] = [:]
    var docelowe: [Int: String] = [:]
    var czasMinuty: Int
}

var tabLotow: [Loty] = []
var nowyLot: Loty
var n = 0
print("Podaj ilosc lotow")
if let x = Int(readLine()!), x>0{
    n = x
    print("No i fajnie, podales \(n)")
    print("Dobra, teraz podaj wartosci wszystkich lotow :^)")
    var index = 0
    var warunek: Bool
    var nr1 = 0, nr2 = 0, nr3 = 0
    var nzw1, nzw2: String
    while(n>0){
        warunek = true
        repeat{
            print("Podaj nr lotniska wylotu #\(index+1):")
            if let x = Int(readLine()!), x>0{
                nr1 = x
                warunek = false
            }
        }while(warunek)
        print("Podaj nazwe lotniska wylotu #\(index+1):")
        nzw1 = readLine()!
        warunek = true
        repeat{
            print("Podaj nr lotniska docelowego #\(index+1):")
            if let x = Int(readLine()!), x>0{
                nr2 = x
                warunek = false
            }
        }while(warunek)
        print("Podaj nazwe lotniska docelowego #\(index+1):")
        nzw2 = readLine()!
        warunek = true
        repeat{
            print("Podaj czas lotu w minutach")
            if let x = Int(readLine()!), x>60{
                nr3 = x
                warunek = false
            }
            else{
                print("Za krotko!")
            }
        }while(warunek)
        nowyLot = Loty(czasMinuty: nr3)
        nowyLot.wylot[nr1] = nzw1
        nowyLot.docelowe[nr2] = nzw2
        tabLotow.append(nowyLot)
        n -= 1
        index += 1
    }
    for lot in tabLotow{
        print(lot)
    }
    var suma = 0
    for l in tabLotow{
        suma += l.czasMinuty
    }
    var srednia = suma/tabLotow.count
    print("Srednia dlugosc lotu = \(srednia)")
    print("Oto loty, ktore trwaja dluzej niz srednia:")
    for l in tabLotow{
        if(l.czasMinuty > srednia){
            print(l)
        }
        else{
            tabLotow.remove(at: tabLotow.firstIndex(of: l)!)
        }
    }
    print("Usunieto elementy, ktore trwaly mniej niz srednia")
}
else{
    print("Nastepnym razem podaj dodatnia liczbe")
}
