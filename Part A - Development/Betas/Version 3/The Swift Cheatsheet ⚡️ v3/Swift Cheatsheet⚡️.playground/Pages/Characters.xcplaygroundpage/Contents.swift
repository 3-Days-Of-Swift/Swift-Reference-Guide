//: ## ![3DaysOfSwift.com Logo](PageHeader.png) ⚡️ The Swift Cheatsheet
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [3 Days of Swift Bootcamp](https://www.3DaysOfSwift.com/bootcamp) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
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
//: ![3 Days Of Swift Logo](Footer.png) [Website](https://www.3DaysOfSwift.com) | [3 Days Of Swift Bootcamp](https://www.3DaysOfSwift.com/bootcamp) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: © Copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com). All rights reserved. Don't forget - come back when you've got an [interview](https://www.3DaysOfSwift.com/interview-prep)!
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
