//: [Previous](@previous)

import Foundation

//qn1
extension String {
    func addCharacter(char: Character) -> String {
        var new = Array(self)
        new.insert(char, at: 5)
        return String(new)
    }
    
    mutating func MaddCharacter(char: Character) -> String {
        let pos = self.index(self.startIndex, offsetBy: 5)
        self.insert(char, at: pos)
        return String(self)
    }
    
    func replaceCharacter(char: Character, newChar: Character) -> String {
        var newString = Array(self)
        var index = 0
        for i in newString {
            if(i == char) {
                newString[index] = newChar
            }
            index = index+1
        }
        return String(newString)
    }
    
    func removeWhiteSpace() -> String {
        let newString = self.trimmingCharacters(in: .whitespaces)
        return newString
    }
    
    func getWordCount() -> Int {
        let newString = self.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
        return newString.count
    }
}

var string: String = "  Bansi Mamtora    "
print(string.addCharacter(char: "i"))
print(string.MaddCharacter(char: "i"))
print(string.replaceCharacter(char: "M", newChar: "@"))
print(string.removeWhiteSpace())
print(string.getWordCount())
