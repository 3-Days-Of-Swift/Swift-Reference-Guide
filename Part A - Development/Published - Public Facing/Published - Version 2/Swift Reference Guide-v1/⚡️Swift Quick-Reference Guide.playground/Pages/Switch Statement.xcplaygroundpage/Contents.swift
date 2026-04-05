//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com)
//:
//: -------------------
//:
//: ## Switch Statement
//:
//: Switch statements allow us to provide a different branch of code for multiple scenarios.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


// many scenarios
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


// few scenarios
enum Scenarios {
    case scenario1
    case scenario2
}

let scenario = Scenarios.scenario1
switch scenario {
case .scenario1:
    print("scenario1")
case .scenario2:
    print("scenario2")
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
