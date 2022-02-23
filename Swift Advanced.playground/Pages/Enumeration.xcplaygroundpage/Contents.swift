import Foundation

//qn1
enum WeekDays: Int {
    case Monday = 1, Tuesday , Wednesday, Thursday, Friday, Saturday, Sunday
    var short: String {
        switch self {
        case .Monday :
            return "Mon"
        case .Tuesday :
            return "Tue"
        case .Wednesday :
            return "Wed"
        case .Thursday :
            return "Thur"
        case .Friday :
            return "Fri"
        case .Saturday :
            return "Sat"
        case .Sunday :
            return "Sun"
        }
    }
}
let day: String
if let day = WeekDays(rawValue: 2) {
    print("Today is \(day), shortform - \(day.short)")
} else {
    print("Invalid number")
}

//qn2
enum Months   {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
    
    func getDays() -> Int {
        switch self {
        case .January, .March, .May, .July, .August, .October, .December:
            return 31
        case .February:
            return 28
        case .April, .June, .September, .November  :
            return 30
        }
    }
}

let days = Months.June.getDays()
print(days)

//qn3
enum CountryCodes: Int {
    case India = 91
    case USA = 1
    case UK = 44
    case Uganda = 256
}
print(CountryCodes.USA.rawValue)

//qn4
enum Applications: String {
    case Gpay = "Gpay"
    case Zomato = "Zomato"
    case Instagram = "Instagram"
    case CoinSwitch = "Coin Switch"
}
print(Applications.CoinSwitch.rawValue)

//qn5
enum Constants: Double {

    case pi = 3.14
    case gravity = 9.8
    func getConstants() -> Double { return self.rawValue }
}
print(Constants.pi.rawValue)

//qn6
enum Directions: CaseIterable {
    case north
    case east
    case west
    case south
}
print(Directions.allCases.count)
Directions.allCases.forEach { print($0) }

//qn7
enum Employee {
    case name(String)
    case stack(String,String)
}
let employeeName = Employee.name("Bansi")
let employeeStack = Employee.stack("Mobile", "Trainee Engineer")
switch employeeStack {
    case .name(let name):
        print("Name: \(name)")
    case .stack(let stack, let position):
        print("Stack: \(stack) \nPosition: \(position)")
}

//qn8
enum Importance: String {
    case Low = "Low"
    case High = "High"
}

let value = Importance.High
switch value {
    case .Low:
    print("\(value.rawValue) importance. You can do it later")
    case .High:
    print("\(value.rawValue) Importance. Do it now!")
}
