//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) The Swift Cheatsheet ⚡️
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [The 3 Days of Swift](https://www.3DaysOfSwift.com/3days) | [Interview Prep](https://www.3daysofswift.com/book)
//:
//: -------------------
//:
//: ## Optionals
//:
//: An optional is declared using an enum with two cases:
//:
//: - `some`
//: - `none`
//:
//: Below is a direct replica of the `Optional` enum declared in the Swift Standard Library.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


 enum Optional<T> {
     case some(T)
     case none
 }


//:
//: -------------------
//:
//: The two cases of the enum are displayed below.
//:
//: -------------------
//:


Optional<Int>.some(100)
Optional<Int>.none


//:
//: -------------------
//:
//: The code below stores two optionals in two variables.
//:
//: -------------------
//:


let var1: Optional<Int> = Optional<Int>.some(100)
let var2: Optional<Int> = Optional<Int>.none


//:
//: -------------------
//:
//: Swift provides a shorter way of writing our code (for optionals).
//:
//: It's called the shorthand method.
//:
//: -------------------
//:


let var3: Int? = 100
let var4: Int? = nil


//:
//: -------------------
//:
//: ## Long-form Syntax
//:
//: Long-form syntax is the syntax that is more technically correct as it properly uses the Swift rules for specifying our types.
//:
//: -------------------
//:


let longFormSyntax: Optional<Int> = .some(100)
if case Optional.some(let unwrappedValue) = longFormSyntax {
    print(unwrappedValue)
} else {
    print("No value exists")
}


//:
//: -------------------
//:
//: ## Short-form Syntax
//:
//: Short-form syntax was created as "syntactic sugar" for developers to have a nicer experience with the language.
//:
//: This means Swift engineers added extra code to write code faster.
//:
//: -------------------
//:


var shortFormSyntax: Int? = 100
if let unwrappedValue = shortFormSyntax {
    print(unwrappedValue)
} else {
    print("No value exists")
}


//:
//: -------------------
//:
//: ## Checking if a Value Exists? - Short Form Method
//:
//: To check if a value exists compare the variable to `nil`.
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
//: ## Unwrapping Optionals - Short Form Method
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
//: ## Declaring Optionals - Short Form Method
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
//: ## Unwrapping Optionals - Long Form Method
//:
//: An optional is constructed from an enum with two cases; .some and .none.
//:
//: -------------------
//:


let optionalInt: Optional<Int> = Optional.some(100)
if case Optional.some(let unwrappedValue) = optionalInt {
    print(unwrappedValue)
} else {
    print("No value exists")
}


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
//: ![3DaysOfSwift.com Logo](3DaysOfSwift-Footer.png) ©
//:
//: Copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com). All rights reserved.
//:
//: [Website](https://www.3DaysOfSwift.com) | [The 3 Days Of Swift](https://www.3DaysOfSwift.com/3days) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
