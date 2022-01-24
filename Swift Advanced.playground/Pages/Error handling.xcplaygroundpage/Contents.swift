//: [Previous](@previous)

import Foundation

//qn1
enum PasswordErrors: Error {
    case ShortPassword
    case EmptyPassword
}
func setPassword(password: String) throws{
    if password.count < 8 {
        throw PasswordErrors.ShortPassword
    }
    else if password.isEmpty {
        throw PasswordErrors.EmptyPassword
    }
    else {
        print("Password set")
    }
}

let password: String = "bansi"
do {
    try setPassword(password: password)
}
catch PasswordErrors.ShortPassword {
    print("Try a password with length greater tha 8!")
}
catch PasswordErrors.EmptyPassword {
    print("No password entered")
}

//qn2
enum ShoppingCartErrors: Error {
    case OutOfStock
}
func purchaseItem(quantity: Int, availableQuantity: inout Int) throws {
    if quantity > availableQuantity {
        throw ShoppingCartErrors.OutOfStock
    }
    else {
        availableQuantity -= quantity
        print("Purchased \(quantity) items, Available now: \(availableQuantity) items")
    }
}
var totalQuantity: Int = 500
do {
    try purchaseItem(quantity: 600, availableQuantity: &totalQuantity)
}
catch ShoppingCartErrors.OutOfStock {
    print("Sorry! Out of Stock.")
}
