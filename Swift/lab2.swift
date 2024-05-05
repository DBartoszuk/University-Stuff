//
//  main.swift
//  DB_Lab2
//
//  Created by student on 12/10/2023.
//

import Foundation

//Zad1
//var bok: Double
//print("Podaj bok szescianu: ")
//bok = Double(readLine()!)!
//print("Pole calkowite: \(String(format: "%.2f", 6.0*bok*bok))\nObjetosc: \(String(format: "%.2f", pow(bok, 3)))")

//Zad2
//var a, b, z, s, c: Double
//print("Prosze podac rozmiar pokoju: ")
//a=Double(readLine()!)!
//b=Double(readLine()!)!
//print("Prosze podac dlugosc korytarza: ")
//z=Double(readLine()!)!
//print("Prosze podac szerokosc drzwi: ")
//s=Double(readLine()!)!
//print("Prosze podac cene za metr listwy: ")
//c=Double(readLine()!)!
//print("Oto co zostalo podane\na: \(a), b: \(b), z: \(z), s: \(s), c: \(c)")
//print("Potrzebne jest \(2*a+(4*b-3*s)+2*z) metrow listwy")
//print("Cena potrzebna do zakupu listwy: \(String(format: "%.2f",c*(2*a+(4*b-3*s)+2*z)))")

//Zad3
//var x, y, z: Int
//x = Int.random(in:1...9)
//y = Int.random(in:1...9)
//z = Int.random(in:1...9)
//print("Wylosowane liczby: \(x), \(y), \(z)")
//print("Ich srednia arytmetyczna: \(String(format: "%.2f", Double(x+y+z)/3.0))")

//Zad4
//var o1, o2, o3, w1, w2, w3: Int
//print("Prosze wczytac 3 oceny: ")
//o1 = Int(readLine()!)!
//o2 = Int(readLine()!)!
//o3 = Int(readLine()!)!
//print("Teraz prosze podac wagi tych ocen: ")
//w1 = Int(readLine()!)!
//w2 = Int(readLine()!)!
//w3 = Int(readLine()!)!
//print("Oto srednia wazona: \(String(format: "%.2f", Double(o1*w1+o2*w2+o3*w3)/Double(w1+w2+w3)))")

//Zad5
//var jeden = "Oto napis"
//var wielo = """
//            Oto\nnieco\nwiecej\nnapisow
//            """
//print("\(jeden),\n\(wielo)")

//Zad6
//var tekst = """
//            \tNauka kodowania to nie tylko nauka jezyka technologii.\n\n\tTo odkrywanie nowych sposobow myslenia\n\n\ti urzeczywistnianie rozmaitych koncepcji.\n
//            """
//print(tekst)

//Zad7
var imie, imie2, nazwisko, rok: String
var calosc = ""
print("Prosze podac swoje imie, drugie imie, nazwisko oraz rok urodzenia: ")
imie=readLine()!
imie2=readLine()!
nazwisko=readLine()!
rok=readLine()!
calosc = imie+" "+imie2+" "+nazwisko+" "+rok
print(calosc)
let range = calosc.index(before: imie.endIndex) ..< calosc.index(imie.endIndex, offsetBy: imie2.count)
calosc.removeSubrange(range)
print(calosc)
var wiek = 2023 - Int(rok)!
let range2 = calosc.index(calosc.endIndex, offsetBy: rok.count) ..< calosc.endIndex
calosc.removeSubrange(range2)
calosc.append(contentsOf: String(wiek))
print(calosc)
