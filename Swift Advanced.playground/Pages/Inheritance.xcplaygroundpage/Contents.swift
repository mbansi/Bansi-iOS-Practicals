//: [Previous](@previous)

import Foundation

//qn8
class Person {
    var name: String
    var age: Int
    init(name: String,age: Int){
        self.name = name
        self.age = age
    }
}

class Student : Person {
    var college: String
    var course: String
    init(_name: String, _age: Int, college: String,course: String){
        self.college = college
        self.course = course
        super.init(name: _name, age: _age)
    }
}

class Employee : Person {
    var company: String
    var role: String
    init(_name: String, _age: Int, company: String, role: String){
        self.company = company
        self.role = role
        super.init(name: _name, age: _age)
    }
}

let student = Student(_name: "Bansi", _age: 21, college: "Darshan", course: "Btech")
print("\(student.name) is in \(student.college) studying \(student.course)")

let employee = Employee(_name: "MBansi", _age: 30, company: "Simform", role: "App Developer")
print("\(employee.name) is in \(employee.company) working as \(employee.role)")

//qn9
//mutating func
struct Number {
    var values: [Int]
    mutating func square() {
        var index = 0
        for item in values {
            values[index] = item * item
            index += 1
        }
    }
}
var number = Number(values: [2,3,4,5])
number.square()
print(number.values)

//qn10
class HumanBeing {
    var name: String = ""
    func showStatus(){
        print("\(name) is ",terminator: "")
    }
}

class Students : HumanBeing {
    var course: String = ""
    override func showStatus() {
        super.showStatus()
        print("studying \(course)")
    }
}

class Workers : HumanBeing {
    var occupation: String = ""
    override func showStatus() {
        super.showStatus()
        print("working as \(occupation)")
    }
}

let studentObject = Students()
studentObject.name = "Bansi"
studentObject.course = "Btech Computer Science"
studentObject.showStatus()

let worker = Workers()
worker.name = "ABC"
worker.occupation = "Salesman"
worker.showStatus()

//qn11
class Car {
    static func display(){
        print("New car added.")
    }
}
Car.display()

//qn12
class Base {
    class func baseClassMethod(){
        print("In Base class method")
    }
    static func baseStaticMethod(){
        print("In Base static method")
    }
}

class Child : Base {
    override class func baseClassMethod(){
        print("In Child class method")
    }
//THROWS ERROR BECAUSE STATIC METHODS CANNOT BE OVERRIDEN
//    override static func baseStaticMethod(){
//        print("In Child static method")
//    }
}
Child.baseClassMethod()

//qn19
class Song {
    var singer: String?
    var composer: String?
}

class HipHop : Song {
    var beats: String = "Hiphop"
}

class Classical : Song {
    var tune: String = "Classical"
}

let hiphop = HipHop()
hiphop.singer = "Talha Anjum"
hiphop.composer = "Raftaar"
print("Singer:\(hiphop.singer ?? "Annonymous") Composer:\(hiphop.composer ?? "Annonymous") Beats:\(hiphop.beats)")

let classical = Classical()
classical.singer = "Lata Mangeshkar"
classical.composer = "Asha Bhosle"
print("Singer:\(classical.singer ?? "Annonymous") Composer:\(classical.composer ?? "Annonymous") Tune:\(classical.tune)")

