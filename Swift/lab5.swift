import Foundation

print("Hello, World!")

//srednia harmoniczna: tam gdzie jest mnozenie intow moze wystapic przepelnienie intow (lepiej zliczac na wiekszym typie)

//Zad1
//var tab: [Double] = Array(repeating: 1.0, count: 12)
//for i in tab{
//    print(i)
//}

//Zad2
//var tab: [Int] = []
//for _ in 1...10{
//    tab.append(Int.random(in: 1...100))
//}
//print("Prosze podac liczbe calkowita: ")
//var liczba: Int = Int(readLine()!)!
//tab.insert(liczba, at: 0)
//tab.insert(liczba, at: Int.random(in: 0..<10))
//for i in tab{
//    print(i)
//}

//Zad3
//var l_ele, ele_t, liczba: Int
//print("Prosze podac liczbe elementow w tablicy: ")
//l_ele = Int(readLine()!)!
//if(l_ele > 0){
//    var tab: [Int] = Array(repeating: 0, count: l_ele)
//    print("Wprowadz dane do tablicy:")
//    for i in 0..<l_ele{
//        ele_t = Int(readLine()!)!
//        tab[i] = ele_t
//    }
//    print("Podaj liczbe: ")
//    liczba = Int(readLine()!)!
//    if(liczba == tab.first){print("Liczba jest pierwszym elementem tablicy")}
//    if(liczba == tab.last){print("Liczba jest ostatnim elementem tablicy")}
//    if(liczba != tab.first && liczba != tab.last){print("Liczba nie wystepuje w tablicy")}
//}
//else{
//    print("Rozmiar tablicy <= 0")
//}

//Zad4
//var tab: [Int] = []
//for _ in 0..<Int.random(in: 3...100){
//    tab.append(Int.random(in: 3...100))
//}
//var iloczyn: Double = 1
//var suma: Double = 0
//var mianownik: Double = 0
//for i in tab{
//    suma += Double(i)
//    iloczyn *= Double(i)
//    mianownik += 1/Double(i)
//}
//print("Srednia arytmetyczna: \(suma/Double(tab.count))")
//print("Srednia geometryczna: \(pow(iloczyn, (1/Double(tab.count))))")
//print("Srednia harmoniczna: \(Double(tab.count)/mianownik)")

//Zad5
//var l_elem: Int
//var zawiera = true
//print("Podaj liczbe elementow dla dwoch tablic: ")
//l_elem = Int(readLine()!)!
//var tab1, tab2: [Int]
//tab1 = []
//tab2 = []
//if(l_elem > 0){
//    for _ in 1...l_elem{
//        tab1.append(Int.random(in: 1...20))
//        tab2.append(Int.random(in: 1...20))
//    }
//    for i in tab1{
//        if(!tab2.contains(i)){zawiera = false}
//    }
//    if(!zawiera){
//        print("Tablice NIE zawieraja identycznych wartosci")
//    }
//    else{
//        print("Tablice zawieraja identyczne wartosci")
//    }
//}
//else{print("Rozmiar tablic <= 0")}

//Zad6
//var mac: [[Int]] = Array(repeating: Array(repeating: 0, count: Int.random(in: 1...5)), count: Int.random(in: 1...5))
//
//for i in 0 ..< mac.count {
//    for j in 0 ..< mac[i].count{
//        mac[i][j] = Int.random(in: 0..<10)
//    }
//}
//
//for i in 0 ..< mac.count {
//    for j in 0 ..< mac[i].count{
//        print("\(mac[i][j])", terminator:" ")
//    }
//    print()
//}

//Zad7

//var k, w: Int
//print("Podaj liczbe wierszy macierzy: ")
//w = Int(readLine()!)!
//print("Podaj liczbe kolumn macierzy: ")
//k = Int(readLine()!)!
//
//var mini, maxi: Double
//
//var mac: [[Double]] = Array(repeating: Array(repeating: 0, count: k), count: w)
//for i in 0 ..< w{
//    for j in 0 ..< k{
//        mac[i][j] = Double.random(in: -100...100)
//    }
//}
//mini = mac[0][0]
//maxi = mac[0][0]
//for i in 0 ..< mac.count {
//    for j in 0 ..< mac[i].count{
//        if(mac[i][j] > maxi){maxi = mac[i][j]}
//        if(mac[i][j] < mini){mini = mac[i][j]}
//        print("\(mac[i][j])", terminator:" ")
//    }
//    print()
//}
//
//print("Najwiekszy element w macierzy: \(maxi)\nNajmniejszy element w macierzy: \(mini)")

//Zad8

var l_ele, ele_t, index, index_pom, dl_podciagu, dl_podciagu_pom: Int
dl_podciagu_pom = 1
dl_podciagu = 0
index = 0
index_pom = 0

print("Prosze podac liczbe elementow w tablicy: ")
l_ele = Int(readLine()!)!
if(l_ele > 0){
    var tab: [Int] = Array(repeating: 0, count: l_ele)
    print("Wprowadz dane do tablicy:")
    for i in 0..<l_ele{
        ele_t = Int(readLine()!)!
        tab[i] = ele_t
    }
    print("")
    for i in 0..<tab.count-1{
        if(tab[i] < tab[i+1]){
            index_pom = i
            dl_podciagu_pom += 1
        }
        else{
            if(dl_podciagu_pom > dl_podciagu){
                dl_podciagu = dl_podciagu_pom
                index = index_pom - dl_podciagu+1
            }
            dl_podciagu_pom = 1
        }
    }
    if(dl_podciagu_pom > dl_podciagu){
        dl_podciagu = dl_podciagu_pom
        index = index_pom - dl_podciagu+2
    }
    print("Index: \(index), Dlugosc podciagu: \(dl_podciagu)")
}
else{
    print("Rozmiar tablicy <= 0")
}
