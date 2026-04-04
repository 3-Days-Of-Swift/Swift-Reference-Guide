//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) The Swift Cheatsheet ⚡️
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [The 3 Days of Swift](https://www.3DaysOfSwift.com/3days) | [Interview Prep](https://www.3daysofswift.com/book)
//:
//: -------------------
//:
//: ## Characters
//:
//: Strings are constructed of individual `Character` types.
//:
//: You can access the individual `Character` values for a `String` by iterating over the `string` with a `for-in` loop:
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶


//:
//: -------------------
//:
//: ## Single-Character String Literals
//:
//: Create stand-alone `Character` variables from a single-character string literal.  
//:
//: Just ensure you provide the type annotation.
//:
//: -------------------
//:


let exclamationMark: Character = "!"


//:
//: -------------------
//:
//: ## Array of Characters
//:
//: `String` values can be constructed by passing an array of `Character` values as an argument to its initializer.
//:
//: -------------------
//:


let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"


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
