//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com)
//:
//: -------------------
//:
//: ## Functions
//:
//:
//: Functions are grouped lines of code that can be executed together.
//:
//: They allow us to generate "behaviours" that we can piece together like building blocks.
//:
//: Use a variable name with type annotation for each input parameter.
//:
//: Use `->` to return a value.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


func name(label1 variable1: String, label2 variable2: String) -> String {
    return variable1 + variable2
}

// can merge labels and variable names
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}


//:
//: -------------------
//:
//: Execute or "call" a function by writing its name followed by parentheses containing any input values.
//:
//: -------------------
//:


name(label1: "argument 1", label2:  "argument 2")
greet(person: "Bob", day: "Tuesday")


//:
//: -------------------
//:
//: ## Tuples
//:
//: Use a tuple to return more than one value.
//:
//: -------------------
//:


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
// access values using thier label
print(statistics.sum)
// access values using thier position (index)
print(statistics.2)


//:
//: -------------------
//:
//: ## Nested functions
//:
//: Functions can be nested.
//:
//: Nested functions have access to variables that were declared in the outer function.
//:
//: -------------------
//:


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


//:
//: -------------------
//:
//: ## First-class Citizens
//:
//: Functions are "first-class citizens".
//:
//: This means a function can return another function.
//:
//: -------------------
//:


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


//:
//: -------------------
//:
//: ## Higher Order Functions
//:
//: A function can take another function as one of its arguments.
//:
//: In Swift, this function would then be known as a "Higher Order Function".
//:
//: -------------------
//:


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


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
