//: [Previous](@previous)

import Foundation

//qn1
class Employee {
    var _name: String = "Bansi"
    var name: String {
        get {
            return self._name
        }
    }
}
let employee = Employee()

//THROWS ERROR BECAUSE OF NO SETTER
//employee.name = "Mansi"
print(employee.name)

//qn2
class Height {
    var feet: Double = 0
    var centimeter: Double {
        get {
            return (feet * 30)
        }
        set {
            feet = newValue/30
        }
    }
}
var height = Height()
height.feet = 5.8
print(height.centimeter)

//qn3
class Student {
    var name: String
    var college: String
    
    init(name: String,college: String){
        self.name = name
        self.college = college
    }
}
let student  = Student(name: "Bansi Mamtora",college: "Darshan Univerisity")
print(student.name)
print(student.college)

//qn4
class Privacy {
    private var access: String = "Access"
    func getAccess(){
        print("\(access) granted")
    }
}
var privacy = Privacy()
//THROWS ERROR BECAUSE ACCESS IS PRIVATE AND CANNOT BE CALLED OUTSIDE CLASS
//print(privacy.access)
privacy.getAccess()

//qn5
class Person {
    var id: Int
    var name: String

    init(id: Int,name: String){
        self.id = id
        self.name = name
    }
}
let arrayPerson: [Person] = [Person(id: 101,name:"Bansi"), Person(id: 102,name:"Mansi"),
                             Person(id: 103,name:"Stuti"),Person(id: 104,name:"Krupa")]
for person in arrayPerson {
    print("\(person.id) \(person.name)")
}

//qn6
class Application {
    var name: String = "Unknown" {
        willSet{
            print("Creating new app - \(newValue)")
        }
        didSet {
            if name.count < 3 {
                name = oldValue
            }
        }
    }
    
}
var app = Application()
app.name = "iOS App"
print(app.name)

//qn7
class Retirement {
    var age: Int
    init(age: Int){
        self.age = age
    }
    lazy var retirementStatus: Retired = Retired()
}
class Retired {
    init() {
        print("Allowed to retire")
    }
}
let person = Retirement(age: 40)
person.retirementStatus

//qn20
class ReadWrite {
    var value: Int = 0
}
var readwrite = ReadWrite()
print(readwrite.value)
readwrite.value = 100
print(readwrite.value)

