//: ## ![3DaysOfSwift.com Logo](PageHeader.png) ⚡️ The Swift Cheatsheet
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [3 Days of Swift Bootcamp](https://www.3DaysOfSwift.com/bootcamp) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: -------------------
//:
//: ## Subscript
//:
//: Subscript uses square brackets (`[]`) to perform a query operation (get or set) on an instance of a type.
//:
//: Collecton types often use this syntax.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


// Array
var shoppingList: [String] = [
    "cheese",
    "milk",
    "water",
    "bread"
]
let firstElement = shoppingList[0]

// Dictionary
let occupations: [String: String] = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
    "James": "Swift Engineer",
]
let malcomsOccupation = occupations["Malcom"]


//:
//: -------------------
//:
//: ## Subscript & Arrays
//: We can *access* and *update existing values* using subscript on arrays.
//:
//: -------------------
//:


// access elements
let firstItem = shoppingList[0]
let secondItem = shoppingList[1]
let thirdItem = shoppingList[2]
let fourthItem = shoppingList[3]

// update existing values
shoppingList[0] = "french baguette"
shoppingList[1] = "brie cheese"
shoppingList[2] = "broccoli"
shoppingList[3] = "french baguette"


//:
//: -------------------
//:
//: ## Arrays - Index Out of Bounds Crash
//:
//: ⚠️ Be careful when using subscript to access values in an array.
//:
//: If no element exists at the position passed to subscript the entire application will crash! 💥 😱
//:
//: -------------------
//:


let toDoList: [String] = [
    "Swimming",
    "Reading",
    "Spanish lesson",
    "Shopping"
]
let firstTask = toDoList[0]
let secondTask = toDoList[1]
let thirdTask = toDoList[2]
let fourthTask = toDoList[3]

// the next line will terminate the application
let fithTask = toDoList[4] // RUN THIS LINE OF CODE! 💥


//:
//: -------------------
//:
//: ## Type Subscripts
//:
//: You can define subscripts on the type itself. 
//:
//: This is a type subscript.
//:
//: -------------------
//:


enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)


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
