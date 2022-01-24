//: [Previous](@previous)

import Foundation
import Darwin

func regenerateHP(hp: inout Int) -> Int {
    if hp == 0 {
        return hp
    }
    else if hp < 20{
        hp = 20
    }
    else {
        let fractionNum = Double(hp) / 10.0
        let roundNum = Int(ceil(fractionNum))
        hp = roundNum * 10
    }
    return hp
}
var hp = 75
print(regenerateHP(hp: &hp))
