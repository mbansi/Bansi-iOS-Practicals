//: [Previous](@previous)

import Foundation

class Cost {
    let mealCost: Double = 3.5
    let tip: Int = 20
    func calculateTotalCost() {
        var totalCost = (Double(tip) * mealCost) / 100
        totalCost += mealCost
        print(totalCost)
    }
}

let cost = Cost()
cost.calculateTotalCost()


