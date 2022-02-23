//: [Previous](@previous)

import Foundation

enum IngredientAge: Error {
    case baconExpired
    case eggsExpired
    case bothExpired
}
func makeBreakfast(baconAge: Int, eggsAge: Int) throws {
    if baconAge > 7, eggsAge > 21 {
        throw IngredientAge.bothExpired
    }
    else if eggsAge > 21 {
        throw IngredientAge.eggsExpired
    }
    else if baconAge > 7 {
        throw IngredientAge.baconExpired
    }
}

let baconAge: Int = 30
let eggsAge: Int = 25
do {
    try makeBreakfast(baconAge: baconAge, eggsAge: eggsAge)
    print("You can cook bacon and eggs")
} catch IngredientAge.bothExpired {
    print("Throw out both bacon and eggs")
} catch IngredientAge.baconExpired {
    print("Throw out Bacon only")
} catch IngredientAge.eggsExpired {
    print("Throw out eggs only")
}
