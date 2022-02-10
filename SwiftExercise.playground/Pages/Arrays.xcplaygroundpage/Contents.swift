import Foundation

//qn1
let arrayIntegers: [Int] = [1,2,3,1]
if arrayIntegers.count >= 1 {
    if arrayIntegers.first == arrayIntegers.last {
        print("Same integers")
    }
    else{
        print("Different integers")
    }
}

//qn2
let givenArray: [Int] = [1,2,3,4]
var new: Array<Int> = Array(repeating: 0, count: givenArray.count*2)
let countGivenArray: Int = givenArray.count
let countNewArray: Int = new.count
new[countNewArray-1] = givenArray.last!
print(givenArray)
print(new)

//qn3
let integers: [Int] = [0,1,2,3]
if integers.count > 2 {
    let newIntegers = integers[...1]
    print(newIntegers)
}
else {
    print(integers)
}

//qn4 -----
let integersArray: [Int] = [0,50,100,20,80,150]
let max = integersArray.max()
print("Maximum = \(max!)")


//qn5----
let sortedIntegers: [Int] = [0,5,6,2,10]
print(Array(sortedIntegers.reversed()))

//qn6
let listOfNumbers: [Int] = [1, 2, 3, 10, 100]
let divisor: [Int] = [2, 5]
for num in listOfNumbers {
    for div in divisor {
        if num % div == 0 {
            print(num,terminator: " ")
            break
        }
    }
}

//qn7
//Array functions
print("\n\nArray functions")
var array = Array<Int>()
var even = [2,4,6,8,10,12,14,16,18,20,22,24,24,24,26,28,30]
array.append(contentsOf: even)
print(array)

array.insert(0, at: 0)
print(array)
print(array.popLast()!)
print(array.contains(3))
print(array.contains{ $0 > 100 })
array.removeSubrange(..<3)
print(array)

if let index = array.firstIndex(of: 10) {
    print(index)
}
array.forEach { print($0 , terminator: " ") }

print("\n\(array.min()!)")
print(array.max()!)
print(array.dropFirst(5))
print(array.dropLast(5))

let sum = array.reduce(0, { x, y in
    x + y
})
print(sum)

var newArray = [1,2,3,4]
newArray.swapAt(0, 3)
print(newArray)

let map = newArray.map { Array(repeating: $0, count: $0) }
print(map)
let flatmap = newArray.flatMap{ Array(repeating: $0, count: $0) }
print(flatmap)

var reversed : [Int] = Array(newArray.reversed())
print(reversed)
newArray.reverse()
print(newArray)

var shuffled :  [Int] = Array(newArray.shuffled())
print(shuffled)
newArray.shuffle()
print(newArray)
