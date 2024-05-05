import Foundation
print("Hello, World!")
//Zadanie 1
// var osoba1 = (imie: "Ania", nazwisko: "Kamińskia", rok_ur: 1997)
// var osoba2 = (imie: "Marcin", nazwisko: "Nazdebzki", rok_ur: 1995)
// if(osoba1.rok_ur < osoba2.rok_ur){print("Osoba o imieniu \(osoba1.imie) jest starsza od osoby o imieniu \(osoba2.imie)")}
// else if(osoba1.rok_ur > osoba2.rok_ur){print("Osoba o imieniu \(osoba2.imie) jest starsza od osoby o imieniu \(osoba1.imie)")}
// else{print("\(osoba1.imie) oraz \(osoba2.imie) mają tyle samo lat")}
//Zadanie 2
//enum Ocena: Double, CaseIterable{
//    case dwa = 2.0
//    case trzy = 3.0
//    case trzy_i_pol = 3.5
//    case cztery = 4.0
//    case cztery_i_pol = 4.5
//    case piec = 5.0
//}
//
//var tab: [(nazwisko: String, ocena1: Double, ocena2: Double, ocena3: Double)] = Array(repeating: (nazwisko: "a", ocena1: 2.0, ocena2: 2.0, ocena3: 2.0), count: 3)
//
//var nazw: String
//var oc1, oc2, oc3: Double
//var czytaj = false
//oc1=1;oc2=0;oc3=0
//
//for i in 0...2{
//    print("Podaj dane studenta (Nazwisko i 3 oceny)")
//    nazw = readLine()!
//    repeat{
//        print("Podaj ocene (2.0-5.0): ")
//        if let o = Double(readLine()!){
//            oc1 = o
//        }
//        if let v = Ocena(rawValue: oc1){
//            czytaj = Ocena.allCases.contains(v)
//        }
//    }while !czytaj
//    repeat{
//        print("Podaj ocene (2.0-5.0): ")
//        if let o = Double(readLine()!){
//            oc2 = o
//        }
//        if let v = Ocena(rawValue: oc2){
//            czytaj = Ocena.allCases.contains(v)
//        }
//    }while !czytaj
//    repeat{
//        print("Podaj ocene (2.0-5.0): ")
//        if let o = Double(readLine()!){
//            oc3 = o
//        }
//        if let v = Ocena(rawValue: oc3){
//            czytaj = Ocena.allCases.contains(v)
//        }
//    }while !czytaj
//    tab[i] = (nazwisko: nazw, ocena1: oc1, ocena2: oc2, ocena3: oc3)
//}
//
//tab.sort(by: {(($0.ocena1 + $0.ocena2 + $0.ocena3)/3.0) > (($1.ocena1 + $1.ocena2 + $1.ocena3)/3.0)})
//print(tab)

//Zadanie 3
//var l_mieszkan: Int
//print("Podaj liczbe mieszkan: ")
//l_mieszkan = Int(readLine()!)!
//
//var lok: String
//var pow, cen: Double
//
//var tab: [(lokalizacja: String, powierzchnia: Double, cena: Double)] = []
//for i in 0..<l_mieszkan{
//    print("Podaj lokalizacje mieszkania #\(i+1): ")
//    lok = readLine()!
//    print("Podaj powierzchnie mieszkania #\(i+1): ")
//    pow = Double(readLine()!)!
//    print("Podaj cene za metr mieszkania #\(i+1): ")
//    cen = Double(readLine()!)!
//    tab.append((lokalizacja: lok, powierzchnia: pow, cena: cen))
//}
//tab.sort(by: {$0.cena > $1.cena})
//print("Najdrozsze mieszkanie: \(tab[0])\nNajtansze mieszkanie: \(tab[l_mieszkan-1])")
//
//print("Podaj lokalizacje: ")
//lok = readLine()!
//for mieszkanie in tab{
//    if(mieszkanie.lokalizacja == lok){print(mieszkanie)}
//}

//Zadanie 4

//enum Miesiac: String, CaseIterable{
//    case styczen = "styczen"
//    case luty = "luty"
//    case marzec = "marzec"
//    case kwiecien = "kwiecien"
//    case maj = "maj"
//    case czerwiec = "czerwiec"
//    case lipiec = "lipiec"
//    case sierpien = "sierpien"
//    case wrzesien = "wrzesien"
//    case pazdziernik = "pazdziernik"
//    case listopad = "listopad"
//    case grudzien = "grudzien"
//}
//var czytaj = false
//var pom: String
//
//repeat{
//        print("Podaj miesiac: ")
//        pom = readLine()!
//        if let v = Miesiac(rawValue: pom){
//            czytaj = Miesiac.allCases.contains(v)
//        }
//}while !czytaj
//
//switch (pom){
//case Miesiac.grudzien.rawValue:
//        fallthrough
//    case Miesiac.styczen.rawValue:
//        fallthrough
//    case Miesiac.luty.rawValue:
//        print("Zima")
//    case Miesiac.marzec.rawValue:
//        fallthrough
//    case Miesiac.kwiecien.rawValue:
//        fallthrough
//    case Miesiac.maj.rawValue:
//        print("Wiosna")
//    case Miesiac.czerwiec.rawValue:
//        fallthrough
//    case Miesiac.lipiec.rawValue:
//        fallthrough
//    case Miesiac.sierpien.rawValue:
//        print("Lato")
//    case Miesiac.wrzesien.rawValue:
//        fallthrough
//    case Miesiac.pazdziernik.rawValue:
//        fallthrough
//    case Miesiac.listopad.rawValue:
//        print("Jesien")
//default: print("Co?")
//}

//Zadanie 5

enum Standard: String, CaseIterable{
    case wysoki = "wysoki"
    case niski = "niski"
    case sredni = "sredni"
}

var l_mieszkan: Int
print("Podaj liczbe mieszkan: ")
l_mieszkan = Int(readLine()!)!

var lok, pom: String
var pow, cen: Double
var czytaj = false

var tab: [(lokalizacja: String, powierzchnia: Double, cena: Double, stand: String)] = []
for i in 0..<l_mieszkan{
    print("Podaj lokalizacje mieszkania #\(i+1): ")
    lok = readLine()!
    print("Podaj powierzchnie mieszkania #\(i+1): ")
    pow = Double(readLine()!)!
    print("Podaj cene za metr mieszkania #\(i+1): ")
    cen = Double(readLine()!)!
    repeat{
        print("Podaj standard: ")
        pom = readLine()!
        if let v = Standard(rawValue: pom){
            czytaj = Standard.allCases.contains(v)
        }
    }while !czytaj
    tab.append((lokalizacja: lok, powierzchnia: pow, cena: cen, stand: pom))
}
tab.sort(by: {$0.cena > $1.cena})
print("Najdrozsze mieszkanie: \(tab[0])\nNajtansze mieszkanie: \(tab[l_mieszkan-1])")

print("Podaj lokalizacje: ")
lok = readLine()!
for mieszkanie in tab{
    if(mieszkanie.lokalizacja == lok){print(mieszkanie)}
}
