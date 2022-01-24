//: [Previous](@previous)

import Foundation

func checkLeapYear(year: Int) -> String {
    if year % 400 == 0 {
        return "Leap year"
    } else if year % 100 == 0 {
        return "Not Leap year"
    } else if year % 4 == 0{
        return "Leap year"
    }
    return "Not leap year"
}

print(checkLeapYear(year: 2014))
