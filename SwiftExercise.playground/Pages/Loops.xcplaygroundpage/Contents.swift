import Foundation

//qn1
let n: Int = 100
var i: Int = 2
while (i <= n) {
  print(i)
   i = i * 2
}

//or
print("\n")
var prod = 2
for _ in 1...100 where prod <= 100 {
    print("\(prod)")
    prod *= 2
}
 

//qn2
let asterickNumber: Int = 3
for _ in 1...asterickNumber {
        print(String(repeating: "*", count: asterickNumber))
}

//qn3
let triangle: Int = 4
for i in 1...triangle {
    for _ in 1...i {
        print("*", terminator: "")
        //print(String(repeating: "*", count: j))
    }
    print("\n")
}

//qn4
let pyramid: Int = 4
for i in 1...pyramid
 {
   print(String(repeating: " ", count: pyramid-i) + String(repeating: "*", count: 2*i - 1))
 }

//qn5
let num: Int = 17
var flag: Int = 0
for i in 2...(num/2) {
    if num % i == 0 {
        flag = 1
        break
    }
}
let result = flag == 0 ? "Prime number" : "Not prime number"
print("\(num) is \(result)")

