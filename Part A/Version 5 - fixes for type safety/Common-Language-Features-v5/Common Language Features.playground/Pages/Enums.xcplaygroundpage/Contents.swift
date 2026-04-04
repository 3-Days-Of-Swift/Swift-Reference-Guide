//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [The 3 Days of Swift](https://www.3DaysOfSwift.com/3days)
//:
//: -------------------
//:
//: ## Enums
//:
//:
//: Enums represent state and list scenarios called cases.
//:
//: Each enumeration can contain functions.
//:
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


enum DoorState {
    case locked
    case unlocked
}

let frontDoorStatus = DoorState.locked
switch frontDoorStatus {
case .locked:
    print("Front door is locked.")
case .unlocked:
    print("Front door is unlocked.")
}


//:
//: -------------------
//:
//: ## Raw Values
//:
//: The enum can be set to represent a specific type, such as an `Int`.
//:
//: This is called a "raw value".
//:
//: -------------------
//:

enum Month: Int {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
}

let january = Month(rawValue: 1)
let december = Month(rawValue: 12)


//:
//: -------------------
//:
//: ## Auto-incrementing Raw Values
//:
//: An enum with a raw value will automatically increment the next case by `1`.
//:
//: This can be useful to keep the code clean and easy-to-read.
//:
//: -------------------
//:


enum Month2: Int {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

let january2 = Month2(rawValue: 1)
let december2 = Month2(rawValue: 12)


//: -------------------
//:
//: ## Associated Values
//:
//: Another choice for enumeration cases is to have values associated with them.
//:
//: Think of associated values behaving like stored properties of the case instance.
//:
//: For example, consider the case of requesting the sunrise and sunset times from a server. The server either responds with the information, or with a description of what went wrong.
//:
//: -------------------
//:


enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure...  \(message)")
}


//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:
//: ![3DaysOfSwift.com Logo](3DaysOfSwift-Footer.png) ©
//:
//: Copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com). All rights reserved.
//:
//: [Website](https://www.3DaysOfSwift.com) | [The 3 Days Of Swift](https://www.3DaysOfSwift.com/3days)
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
