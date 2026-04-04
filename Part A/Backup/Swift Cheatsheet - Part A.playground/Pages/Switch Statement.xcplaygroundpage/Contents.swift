//: ## ![The Swift Logo](swiftLogo43.png) Switch Statement
//:
//: Switch statements allow us to provide a different branch of code for multiple scenarios.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


let age = 40
switch age {
case 0...50:
    print("0 to 50 years old")
case 51...60:
    print("51 to 50 years old")
case 61...70:
    print("61 to 70 years old")
case 71...80:
    print("71 to 80 years old")
case 81...90:
    print("81 to 90 years old")
case 91...100:
    print("91 to 100 years old")
default:
    print("Age is \(age)")
}

//:
//: -------------------
//:
//: ## Where Clause
//:
//: Switches support a wide variety of comparison operations and aren’t limited to simple tests for equality.
//:
//: The where clause is powerful. It can be used to inspect the switched on value when a certain condition is met.
//:
//: -------------------
//:

let vegetable = "red pepper"
switch vegetable {
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    default:
        print("Everything tastes good in soup.")
}


//:
//: -------------------
//:
//: ## Default Case
//:
//: Switches must provide one branch of code for every possible scenario.
//:
//: If a case statement doesn't exist for every scenario the `default` keyword must be used to generate the main branch of code when all other conditions are not met.
//:
//: -------------------
//:

// default statement needed
switch age {
case 1:
    print("1 year old")
case 2:
    print("2 years old")
case 3:
    print("3 years old")
case 4:
    print("4 years old")
case 5:
    print("5 years old")
case 6:
    print("6 years old")
default:
    print("Age is \(age)")
}

// no default statement needed
let studentPassedExam: Bool = true
switch studentPassedExam {
case true:
    print("Passed!")
case false:
    print("Failed!")
}


//:
//:
//: -------------------
//: 
//: [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [Email Us](mailto:helloworld@3daysofswift.com?subject=Hello)
//:
//: Ready to start learning Swift? [Yes ✅](https://www.3DaysOfSwift.com)
//:
/*:
 */
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
