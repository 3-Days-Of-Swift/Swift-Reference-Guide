//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com)
//:
//: -------------------
//:
//: ## Swift Type Safety
//:
//: In other programming languages a variable might accidently contain a different and unexpected type, resulting in a runtime error.
//:
//: Swift ensures that all variables store the correct type at compile time.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


var studentPassed: String = "Student Name"
studentPassed = 1
studentPassed = 1.0


//:
//: -------------------
//:
//: ## Variable Assignment Safety
//:
//: During compile time, the Swift compiler ensures all variables are set a value before being used.
//:
//: -------------------
//:


let score: Int
var passed: Bool

print(passed) // used before value is set

if (score > 50) { // used before value is set
    passed = true
} else {
    passed = false
}

print(passed)


//:
//: -------------------
//:
//: ## Assignment Operator Safety
//:
//: Unlike other languages, the assignment operator (`=`) does not return a value.
//:
//: This prevents accidental use within a conditional such as an if statement.
//:
//: -------------------
//:


var x: Int = 100
let y: Int = 100
if x = y {

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
//: [Website](https://www.3DaysOfSwift.com)
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
