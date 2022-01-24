import Foundation

//declaring optional
var number: Int? = 10

//forced unwrapping
//print(number)
print(number!)

//optional binding
//if-let
if let number = number {
    print(number)
}
else{
    print("null")
}

//guard let
func checkAge() {
    var age: Int?
    guard let myAge = age else {
    print("Age is undefined")
    return
  }
  print("My age is \(myAge)")
}
checkAge()

//nil coalescing
let name: String? = nil
let unwrappedName = name ?? "Anonymous"
print("Hey \(name ?? "Anonymous")")
