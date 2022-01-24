import Foundation

//string concatenation
let firstName: String = "Bansi"
let surname: String = "Mamtora"
let fullName = firstName + " " + surname
print(fullName)

//operations with integer and floats
let number1 = 0.5
let number2 = 20
print("\nAddition: \(number1 + Double(number2))")
print("Subtraction: \(number1 - Double(number2))")
print("Multiplication: \(number1 * Double(number2))")
print("Division: \(number1 / Double(number2))")

//ternary operator
print(number1 > Double(number2) ? "\n\(number1) is larger" : "\n\(number2) is larger"  )
