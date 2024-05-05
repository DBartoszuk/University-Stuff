import Foundation

print("Hello, World!")
//Zad1
//var tekst, znak: String
//var liczba, pomoc: Int
//pomoc = 1
//print("Podaj ciag znakowy, znak oraz liczbe calkowita: ")
//tekst = readLine()!
//znak = readLine()!
//liczba = Int(readLine()!)!
//print("Ciag: \(tekst)\nznak: \(znak)\nliczba: \(liczba)")
//if tekst.hasPrefix(znak){print("\(znak) wystepuje na poczatku ciagu")}
//else{pomoc+=1}
//if tekst.hasSuffix(znak){print("\(znak) wystepuje na koncu ciagu")}
//else{pomoc+=1}
//if String(tekst[tekst.index(tekst.startIndex, offsetBy: liczba)]) == znak{print("\(znak) wystepuje na indeksie \(liczba) od poczatku")}
//else{pomoc+=1}
//if String(tekst[tekst.index(tekst.endIndex, offsetBy: -liczba)]) == znak{print("\(znak) wystepuje na indeksie \(liczba) od konca")}
//else{pomoc+=1}
//if(pomoc==5){print("\(znak) nie wystapil w ciagu ani na poczatku, ani na koncu, ani na indeksach oddalonych o \(liczba) od obu stron")}

//Zad2
//var ciag1, ciag2, prefiks, sufiks: String
//var pomoc: Bool
//
//print("Prosze podac 2 ciagi")
//ciag1 = readLine()!
//ciag2 = readLine()!
//if(ciag1 == ciag2){
//    print("Ciagi sa identyczne!")
//    pomoc = true
//}
//else{
//    print("Ciagi sa rozne")
//    pomoc = false
//}
//print("Prosze podac prefiks")
//prefiks = readLine()!
//if(pomoc){
//    if(ciag1.hasPrefix(prefiks)){print("\(prefiks) wystepuje na poczatku ciagow")}
//    else {print("\(prefiks) nie wystepuje na poczatku ciagow")}
//}
//else{
//    if(ciag1.hasPrefix(prefiks)){print("\(prefiks) wystepuje na poczatku ciagu #1")}
//    else {print("\(prefiks) nie wystepuje na poczatku ciagu #1")}
//    if(ciag2.hasPrefix(prefiks)){print("\(prefiks) wystepuje na poczatku ciagu #2")}
//    else {print("\(prefiks) nie wystepuje na poczatku ciagu #2")}
//}
//print("Prosze podac sufiks")
//sufiks = readLine()!
//if(pomoc){
//    if(ciag1.hasSuffix(sufiks)){print("\(sufiks) wystepuje na koncu ciagow")}
//    else {print("\(sufiks) nie wystepuje na koncu ciagow")}
//}
//else{
//    if(ciag1.hasSuffix(sufiks)){print("\(sufiks) wystepuje na koncu ciagu #1")}
//    else {print("\(sufiks) nie wystepuje na koncu ciagu #1")}
//    if(ciag2.hasSuffix(sufiks)){print("\(sufiks) wystepuje na koncu ciagu #2")}
//    else {print("\(sufiks) nie wystepuje na koncu ciagu #2")}
//}

//Zad3
//let rok: Int
//print("Prosze podac rok: ")
//rok = Int(readLine()!)!
//if((rok % 4 == 0 && rok % 100 != 0) || rok % 400 == 0) {print("Rok przestepny!")}
//else{ print("Nie rok przestepny")}

//Zad4
//let rok: Int
//print("Prosze podac rok: ")
//rok = Int(readLine()!)!
//if(rok > 1 && rok < 3011){
//    switch(rok){
//    case 2..<100:
//        print("Wiek 1")
//    default:
//        print("Wiek \(rok/100 + 1)")
//    }
//}
//else{
//    print("Nastepnym razem podaj rok z zakresu <2, 3010> LOLOLOLOL")
//}

//Zad5
//let srednia: Double
//print("Wpisz srednia: ")
//srednia = Double(readLine()!)!
//switch(srednia){
//case let x where x>4.5:
//    print("Nalezy ci sie stypendium 200 zl!")
//case let x where (x<4.5 && x>=4):
//    print("Nalezy ci sie stypendium 150 zl!")
//case let x where (x<4 && x>=3):
//    print("Nalezy ci sie stypendium 100 zl!")
//default:
//    print("Nie dla Ciebie stypendium ;(")
//}

//Zad6
//let l1, l2: Double
//var wybor: Int
//print("Prosze podac dwie liczby: ")
//l1 = Double(readLine()!)!
//l2 = Double(readLine()!)!
//print("MENU KALKULATORA\n1)\tdodawanie\n2)\todejmowanie\n3)\tmnozenie\n4)\tdzielenie")
//wybor = Int(readLine()!)!
//switch(wybor){
//case 1:
//    print(l1+l2)
//case 2:
//    print(l1-l2)
//case 3:
//    print(l1*l2)
//case 4:
//    if(l2 == 0){
//        print("Niedozwolone dzielenie przez zero!")
//    }
//    else{
//        print(l1/l2)
//    }
//default:
//    print("Costy podal")
//}

//Zad7
let znak: String
let samogloski = ["a", "e", "i", "o", "u", "y"]
let spolgloski = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
let cyfry = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
print("Prosze podac znak: ")
znak = readLine()!
switch(znak){
case let x where samogloski.contains(x):
    print("\(znak) jest samogloska")
case let x where spolgloski.contains(x):
    print("\(znak) jest spolgloska")
case let x where cyfry.contains(x):
    print("\(znak) jest cyfra")
default:
    print("Podany znak nie jest ani samogloska, ani spolgloska, ani cyfra")
}
