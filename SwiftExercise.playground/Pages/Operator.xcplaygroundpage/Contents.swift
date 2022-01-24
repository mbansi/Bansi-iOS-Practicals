import Foundation

//string concatenation
var firstName: String = "Bansi"
var surname: String = "Mamtora"
var fullName = firstName + " " + surname
print(fullName)

//operations with integer and floats
var number1 = 0.5
var number2 = 20
print("\nAddition: \(number1 + Double(number2))")
print("Subtraction: \(number1 - Double(number2))")
print("Multiplication: \(number1 * Double(number2))")
print("Division: \(number1 / Double(number2))")

//ternary operator
print(number1 > Double(number2) ? "\n\(number1) is larger" : "\n\(number2) is larger"  )
