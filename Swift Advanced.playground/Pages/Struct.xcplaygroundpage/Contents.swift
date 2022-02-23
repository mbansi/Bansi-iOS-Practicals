import Foundation

//qn1
struct Work {
    let workLocation: String
    let workHours: Int
    let projectNames: [String]
    
    func getProjectNames() -> [String] {
        return projectNames
    }
}

let workEmployee = Work(workLocation: "Ahmedabad", workHours: 8, projectNames: ["Swiggy","Zomato","Paytm"])
print(workEmployee.getProjectNames())

//qn2
struct Initialiser{
    var name: String
    init(name: String){
        self.name = name
    }
}
let initialiser = Initialiser(name: "Bansi")
print(initialiser.name)

//qn3
struct Employee {
    var name: String
    var age: Int?
    init(){
        self.name = "Unknown"
    }
    init(name: String,age: Int){
        self.name = name
        self.age  = age
    }
}
let employee = Employee(name: "Bansi", age: 21)
print("Employee Name: \(employee.name) Age: \(employee.age!)")
let employee1 = Employee()
print("Employee Name: \(employee1.name) Age: \(String(describing: employee1.age))")

//qn4
struct ArrayInput {
    var numberArray: [Int]
    var evenNumberArray: [Int]
    var oddNumberArray: [Int]
    init(numberArray: [Int]){
        self.numberArray = numberArray
        evenNumberArray = []
        oddNumberArray = []
        for number in numberArray {
            if number % 2 == 0 {
                evenNumberArray.append(number)
            }
            else{
                oddNumberArray.append(number)
            }
        }
    }
}
let array: [Int] = [1, 3, 5, 6, 8, 10, 9, 7, 8, 12]
let structExample = ArrayInput(numberArray: array)
print(structExample.evenNumberArray)
print(structExample.oddNumberArray)

//qn5
struct Person {
    let name: String
    let age: Int
    let gender: String
}

var personArray: [Person] = [Person(name: "Joe", age: 27, gender: "Male"),
                             Person(name: "Harry", age: 21, gender: "Male")]
for person in personArray {
    print("Name: \(person.name) Age: \(person.age) Gender: \(person.gender)")
}

//qn6
struct Example {
    var property: String = ""
}
var example1 = Example()
example1.property = "Hello"
var example2 = example1
example2.property = "Hi"
print(example1.property)
print(example2.property)

//qn7
struct EmployeeStruct {
    let name: String
}
class EmployeeClass {
    var nameClass: String = "Unknown"
    init(nameClass: String){
        self.nameClass = nameClass
    }
}
let employeeStruct = EmployeeStruct(name: "Bansi")
let employeeClass = EmployeeClass(nameClass: "Mansi")

let mixArray: [AnyObject] = [ EmployeeClass(nameClass: "Joe"), EmployeeClass(nameClass: "Harry")]


