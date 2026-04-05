//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com)
//:
//: -------------------
//:
//: ## Closures
//:
//: Closures are simple blocks of code that can be executed at a later time.
//:
//: They are very similar to functions and are very simple to construct.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


let closure: () -> String = {
    return "Hello,"
}
print(closure())


//:
//: -------------------
//:
//: ## Functions are Closures
//:
//: Functions are a special case of named closure.
//:
//: Both use a slightly different syntax.
//:
//: -------------------
//:


// function
func greet(person: String) -> String {
    return "Hello \(person),"
}

// closure
let closure2: (String) -> String = { person in
    return "Hello \(person),"
}


//:
//: -------------------
//:
//: ## Map Function
//:
//: The `map` function is useful on collection types.
//:
//: It accepts a closure, which the `map` function will execute upon each element.
//:
//: -------------------
//:


var numbers = [20, 19, 7, 12]
let codeToExecute = { number in
    return number * 2 // doubles the value
}

// the map function executes a closure
let doubledNumbers = numbers.map(codeToExecute)


//:
//: -------------------
//:
//: ## Shorthand Argument Names
//:
//: You can refer to parameters by number instead of by name.
//:
//: This approach is especially useful in very short closures
//:
//: -------------------
//:


let sortingAlgorithm: (Int, Int) -> Bool = {
    return $0 > $1
}
let sortedNumbers = numbers.sorted (by: sortingAlgorithm)
print(sortedNumbers)


//:
//: -------------------
//:
//: ## Trailing Closures
//:
//: When a closure is passed into a function and it's the last argument it can appear immediately after the parentheses.
//:
//: -------------------
//:


let sortedNumbers2 = numbers.sorted() {
    $0 > $1
}
print(sortedNumbers2)


//:
//: -------------------
//:
//: ## One Argument Functions
//:
//: When a closure is the only argument to a function, you can omit the parentheses entirely.
//:
//: -------------------
//:


let sortedNumbers3 = numbers.sorted { $0 > $1 }
print(sortedNumbers2)


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
