import Foundation

//qn1
var word: String = "Simform"
var wordLength: Int = strlen(word)
if wordLength >= 2 {
    print(word.prefix(2))
}
else {
    print(word)
}

//qn2
let indexStartSubstring = word.index(word.startIndex, offsetBy: 1)
let indexEndSubstring = word.index(word.endIndex, offsetBy: -2)
var substring = word[indexStartSubstring...indexEndSubstring]
if wordLength >= 2 {
    print(substring)
}
else {
    print(word)
}

//qn3
var string1: String = "Swift"
var string2: String = "Examples"
if strlen(string1) >= 1, strlen(string2) >= 1 {
    let newString = string1.suffix(strlen(string1)-1) + string2.suffix(strlen(string2)-1)
    print(newString)
}
//OR
let index1 = string1.index(string1.startIndex, offsetBy: 1)
let index2 = string2.index(string2.startIndex, offsetBy: 1)
print(string1[index1...] + string2[index2...])


//qn4
if strlen(string1) >= 2 {
    let newString1 = string1.suffix(strlen(string1)-2) + string1.prefix(2)
    print(newString1)
}

//qn5
print(string1.hasPrefix("Sw"))

//qn6
var example: String = "Simform Solutions"
print( example.prefix(3) + example.suffix(3))

//qn7
//string functions
var str = String(repeating: "hello", count: 3)
print(str)
print(str.count)
print(str.sorted())
print(String(str.reversed()))
print(str.shuffled())

str.append("bye")
print(str)

var index = str.index(str.startIndex ,offsetBy: 5)
str.insert("Z", at: index)
print(str)

print(str.popLast()!)

var string = "swift string functions"
print(string.lowercased())
print(string.uppercased())

print(str == string)

print(string.contains("if"))
print(string.prefix(3))
print(string.suffix(3))

print(string.split(separator: " "))
print(string.randomElement()!)

let mapString = string.map { $0.uppercased() }
print(mapString)
