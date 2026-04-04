//: ## ![3DaysOfSwift.com Logo](PageHeader.png) ⚡️ The Swift Cheatsheet
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [3 Days of Swift Bootcamp](https://www.3DaysOfSwift.com/bootcamp) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: -------------------
//:
//: ## Foundational Types
//:
//: The Foundational Types declared in the Swift Standard Library are:
//:
//: * `Int` - a whole number.
//: * `Float` - a small decimal number.
//: * `Double` - a decimal number.
//: * `Bool` - either `true` or `false`.
//: * `String` - some text.
//: * `Array` - an ordered list.
//: * `Dictionary` - an unordered collection using unique keys to store values.
//: * `Set` - A collection of unique values.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------


// these are the individual types
let wholeNumber: Int = 100
let smallDecimalNumber: Float = 100.12345
let decimalNumber: Double = 100.123456789012345
let trueOrFalse: Bool = true
let text: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


//:
//: -------------------
//:
//: ## Collection Types
//:
//: To store multiple values Swift provides 3 primary collection types, which are:
//:
//: * `Array` - an ordered list.
//: * `Dictionary` - an unordered collection using unique keys to store values.
//: * `Set` - A collection of unique values.
//:
//: -------------------
//:


// these are the collection types
let anArray = [1, 2, 3, 4, 5]
let aDictionary = ["key1": 1, "key2": 2, "key3": 3, "key4": 4, "key5": 5]
let aSet: Set = [1, 2, 3, 4, 5]


//:
//: -------------------
//:
//: * callout(Note):
//:     → Any type in Swift can be substituted for `Any`. `Any` is at the root of the type hierarchy.
//:
//: -------------------
//:


var anything: Any = "A String can be of Type 'Any'"
print(anything)
anything = 45
print(anything)
anything = ["Everything", "is", "of", "type", "Any", "except", "nil!"]
print(anything)


//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:
//: ![3 Days Of Swift Logo](Footer.png) [Website](https://www.3DaysOfSwift.com) | [3 Days Of Swift Bootcamp](https://www.3DaysOfSwift.com/bootcamp) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: © Copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com). All rights reserved. Don't forget - come back when you've got an [interview](https://www.3DaysOfSwift.com/interview-prep)!
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
