//: [Previous](@previous)

import Foundation

//qn13
class Week {
    var weekdays: [String] = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    subscript(day: Int) -> String {
        get {
            return weekdays[day]
        }
     }
}
let weekDay = Week()
print(weekDay[1])

//qn14
class Word {
    let word: String = "Swift Programming"
    subscript(index: String.Index) -> Character {
        get {
            return word[index]
        }
    }
    subscript(range: ClosedRange<String.Index>) -> String {
        get {
            return String(word[range])
        }
    }
}
let example = Word()
let position = example.word.index(example.word.startIndex, offsetBy: 3)
print(example[position])

//qn15
let end = example.word.index(example.word.startIndex, offsetBy: 9)
print(example[position...end])

//qn16
class ReturnRange {
    let numbers = [1,2,3,4]
    func returnRange(start: Int,end: Int) {
        for i in start...end {
            print(numbers[i])
        }
    }
}
let arr = ReturnRange()
arr.returnRange(start: 0, end: 2)

//qn17
class KeyValue {
    let dict: [Int: String] = [1:"Hello", 2:"Hi"]
    subscript(key: Int) -> String {
        return dict[key] ?? "Nil"
    }
}
let keyValue = KeyValue()
print(keyValue[1])

//qn18
class Person {
    var name: String
    var age: Int
    var status: String
    init(name: String,age: Int,status: String){
        self.name = name
        self.age = age
        self.status = status
    }
}
class PersonDetails {
    var array : [Person]
    init(){
        self.array = [Person(name: "Bansi", age: 21, status: "Student"),
                      Person(name: "Mansi", age: 22, status: "Trainee")]
    }
    subscript(name: String)-> Person? {
        get {
            var person1: Person?
            for object in array {
                if name == object.name{
                    person1 = object
                    print("Name: \(object.name), Age:\(object.age), Status: \(object.status)")
                }
            }
            return person1
        }
    }
}

let details = PersonDetails()
details["Bansi"]




