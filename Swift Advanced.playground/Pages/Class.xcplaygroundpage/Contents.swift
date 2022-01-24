import Foundation

//qn1
class Employee {
    var name: String = ""
    var age: Int = 0
}

var e1 = Employee()
e1.name = "Bansi"
e1.age = 21
print("Employee name: \(e1.name)")
print("Employee Age: \(e1.age)")

//qn2
class StudentRajkot {
    var name: String?
    var college: String?
    var department: String?
    
    init(name: String, college: String) {
        self.name = name
        self.college = college
    }
    
    init(name: String, department: String) {
        self.name = name
        self.department = department
    }
}
let s1 = StudentRajkot(name: "Bansi", college: "Darshan University")
print(" Student name: \(s1.name!), College: \(s1.college!) ")

//qn3
class Person {
    var name: String?
    var email: String?
}
let person = Person()
person.name = "Bansi"
person.email = "mbansi306@gmail.com"
print("Name: \(person.name!)")
print("Email: \(person.email!)")

//qn4
class Square {
    var number: Int = 0
    init(number: Int) {
        self.number = number
    }
    func calculateSquare() -> Int {
        number * number
    }
}
let number = Square(number: 5)
print(number.calculateSquare())

//qn5
class VehicleRajkot {
    var wheels: Int = 0
    
}
class Bicycle : VehicleRajkot {
    var speed: Int = 0
}
class Truck : VehicleRajkot {
    var weightCapacity: Int = 100
}
var bicycle = Bicycle()
bicycle.wheels = 2
bicycle.speed = 15
print("Bicycle's Details:- Wheels: \(bicycle.wheels), Speed: \(bicycle.speed)")

var truck = Truck()
truck.wheels = 8
truck.weightCapacity = 350
print("Truck's Details:- Wheels: \(truck.wheels), Weight capacity: \(truck.weightCapacity)")

//qn6
class HumanBeing {
    var name: String = ""
    func showStatus(){
        print("\(name) is ",terminator: "")
    }
}
class Student : HumanBeing {
    var course: String = ""
    override func showStatus() {
        super.showStatus()
        print("studying \(course)")
    }
}
class Worker : HumanBeing {
    var occupation: String = ""
    override func showStatus() {
        super.showStatus()
        print("working as \(occupation)")
    }
}

let student = Student()
student.name = "Bansi"
student.course = "Btech Computer Science"
student.showStatus()

let worker = Worker()
worker.name = "ABC"
worker.occupation = "Salesman"
worker.showStatus()

//qn7
class Power {
    var value: Int = 0
    init(value: Int){
        self.value = value
    }
    func doPower(power: Int) -> Int {
        var answer = 1
        for _ in 1...power {
            answer *= value
        }
        return answer
    }
}
let instance = Power(value: 5)
let result = instance.doPower(power: 3)
print(result)

//qn8
class Vehicle {
    let passengersAllowed: Int = 0
    let fuelCapacity: Int = 30
}
class Bike : Vehicle {
    let accesories = false
}
class Car : Vehicle {
    let smartCar = false
}

//qn9
class PersonGreeting {
    var name: String = ""
    init(name: String){
        self.name = name
    }
    func greet(){
        print("Hello \(name)")
    }
}
let personGreeting = PersonGreeting(name: "Joe")
personGreeting.greet()

//qn10
class Example {
    var property: String = ""
}
let example1 = Example()
example1.property = "Hello"
let example2 = example1
example2.property = "Hi"
print(example1.property)
print(example2.property)
