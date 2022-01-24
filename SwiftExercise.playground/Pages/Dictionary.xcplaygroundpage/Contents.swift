//: [Previous](@previous)

import Foundation

var code = [    "a" : "b",  "b" : "c",  "c" : "d",  "d" : "e",  "e" : "f",
                "f" : "g",  "g" : "h",  "h" : "i",  "i" : "j",  "j" : "k",
                "k" : "l",  "l" : "m",  "m" : "n",  "n" : "o",  "o" : "p",
                "p" : "q",  "q" : "r",  "r" : "s",  "s" : "t",  "t" : "u",
                "u" : "v",  "v" : "w",  "w" : "x",  "x" : "y",  "y" : "z",
                "z" : "a"]
var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
var message = String()
var reversedCode = [String:String]()

for pair in code {
    reversedCode[pair.value] = pair.key
}
print(reversedCode)

for char in encodedMessage {
    if char == " " {
        message += String(char)
    }
    for (key,value) in reversedCode {
        if String(char) == key{
            message += value
        }
    }
}
print(message)

//qn2
var people: [[String:String]] = [[ "firstName": "Calvin",  "lastName": "Newton" ],
                                 [ "firstName": "Garry",   "lastName": "Mckenzie" ],
                                 [ "firstName": "Leah",    "lastName": "Rivera" ],
                                 [ "firstName": "Sonja",   "lastName": "Moreno" ],
                                 [ "firstName": "Noel",    "lastName": "Bowen" ]]
var firstNames = [String]()
for person in people{
    if let fName = person["firstName"] {
        firstNames.append(fName)
    }
}
print(firstNames)

////qn3
var fullNames = [String]()
for person in people{
    if let fName = person["firstName"] , let lName = person["lastName"] {
        fullNames.append(fName + " " + lName)
    }
}
print(fullNames)

//qn4
var peopleDict: [[String:Any]] = [[ "firstName": "Calvin", "lastName": "Newton" ,  "score": 13],
                                 [ "firstName": "Garry",   "lastName": "Mckenzie", "score": 12],
                                 [ "firstName": "Leah",    "lastName": "Rivera",   "score": 10],
                                 [ "firstName": "Sonja",   "lastName": "Moreno",   "score": 3 ],
                                 [ "firstName": "Noel",    "lastName": "Bowen",    "score": 16 ]]
var scores: [Int] = []
for person in peopleDict {
    if let mark = person["score"] {
        scores.append(mark as! Int)
    }
}
print(scores)
let lowest = scores.min()
for person in peopleDict {
    if lowest == (person["score"] as? Int) {
        print("\(person["firstName"]!) \(person["lastName"]!)")
    }
}

//qn5
for person in peopleDict {
    if let mark = person["score"],let fName = person["firstName"], let lName = person["lastName"] {
        print(fName,lName,":",mark)
    }
}

//qn6
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2 ]
let freq = numbers.map { ($0, 1) }
let dict = Dictionary(freq, uniquingKeysWith: +)
for (key,value) in dict {
    print("\(key) : \(value)")
}

