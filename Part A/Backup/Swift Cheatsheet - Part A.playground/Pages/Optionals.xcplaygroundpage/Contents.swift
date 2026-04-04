//: ## ![The Swift Logo](swiftLogo43.png) Optionals
//:
//: Optionals have two states:
//:
//: 1. `some`, which contains a value.
//: 2. `none`, which represents `nil` - the absense of a value.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


let optionalString: String? = "Hello"
if optionalString == nil {
    print("No value exists")
}
if optionalString != nil {
    print("A value exists inside this optional")
}


//:
//: -------------------
//:
//: ## Unwrapping Optionals
//:
//: If we want to use the value contained inside an optional we need to unwrap and extract it first.
//:
//: One of the most common methods of unwrappng is to bind the value to a local variable using an `if` statement.
//:
//: -------------------
//:


let wrappedValue: String? = "John Appleseed"
if let value = wrappedValue {
    print("The value is now unwrapped and usable. The value is \(value)")
}


//:
//: -------------------
//:
//: ## Nil
//:
//: `nil` is the keyword to indicate that no value exists.
//:
//: -------------------
//:


let exam1: Int? = 55
let exam2: Int? = nil
let exam3: Int? = nil
let exam4: Int? = nil
if
    let exam1Score = exam1,
    let exam2Score = exam2,
    let exam3Score = exam3,
    let exam4Score = exam4
{
    print("Student attended all 4 exams! 😎")
    print("Exam 1: \(exam1Score)")
    print("Exam 2: \(exam2Score)")
    print("Exam 3: \(exam3Score)")
    print("Exam 4: \(exam4Score)")
}


//:
//: -------------------
//:
//: ## Declaring Optionals
//:
//: To mark your variable as optional write a question mark (`?`) after the type.
//:
//: -------------------
//:


let optionalInteger: Int? = nil
let optionalFloat: Float? = nil
let optionalDouble: Double? = nil
let optionalBool: Bool? = nil


//:
//: -------------------
//:
//: ## The Optional Enum
//:
//: An optional is constructed from an enum with two cases, .some and .none. Swift provides us with some lovely syntactic sugar to reduce volume of code by substituting a question mark (`?`) to represent this enum on each type declared as an optional.
//:
//: -------------------
//:


enum Optional<T> {
    case some(T)
    case none
}

var optionalIntShortForm: Int? = 100
optionalIntShortForm = nil
var optionalIntLongForm: Optional<Int> = Optional.some(100)
optionalIntLongForm = Optional.none


//:
//: -------------------
//: 
//: [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [Email Us](mailto:helloworld@3daysofswift.com?subject=Hello)
//:
//: Ready to start learning Swift? [Yes ✅](https://www.3DaysOfSwift.com)
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:
//: ## ![3 Days Of Swift Logo](3DaysIcon146.png) 3 Days Of Swift 
//:
//: © Copyright. All rights reserved.
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) students!
