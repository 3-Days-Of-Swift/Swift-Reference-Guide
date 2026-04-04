//: ## ![The Swift Logo](3DaysIcon146.png)  If Statement
//:
//: If statements allow us to change the path of code execution based on some condition.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


// the full syntax
if (10 > 1) == true {
    print("ten is greater")
}

// simplified
if 10 > 1 {
    print("ten is greater")
}


//:
//: -------------------
//:
//: ## Conditions
//:
//: Each if statement condition must evaluate to `true`.
//:
//: The explicit comparison to `true` can be omitted.
//:
//: -------------------
//:


if (true == true) {
    print("The condition is true. This code will execute.")
}

if (true) {
    print("The condition is true. This code will execute.")
}


//:
//: -------------------
//:
//: ## Brackets
//:
//: The brackets are optional.
//:
//: -------------------
//:


if true == true {
    print("The condition is true. This code will execute.")
}

if true {
    print("The condition is true. This code will execute.")
}


//:
//: -------------------
//:
//: ## Conditional Operators
//:
//: In order to construct a condition we can use a variety of operators.
//:
//: -------------------
//:


// a student had an exam
var studentPassed = false
let exam1Score: Int = 50
if exam1Score > 50 {
    studentPassed = true
}

// equal to operator
if exam1Score == 50 {
    print("Exam 1 score is equal to 50")
}

// greater than operator
if exam1Score > 50 {
    print("Exam 1 score is equal to 50")
}

// less than operator
if exam1Score < 50 {
    print("Exam 1 score is equal to 50")
}

// greater than or equal to operator
if exam1Score >= 50 {
    print("Exam 1 score is equal to 50")
}

// less than or equal to operator
if exam1Score <= 50 {
    print("Exam 1 score is equal to 50")
}


//:
//: -------------------
//:
//: ## If Then Else Statement
//:
//: If statements also provide an optional `else` branch of code.
//:
//: The `else` branch of code will execute when the condition is not met and does not evaluate to `true`.
//:
//: -------------------
//:


if exam1Score > 50 {
    print("Passed the exam!")
} else {
    print("Failed the exam!")
}


if exam1Score > 90 {
    print("A+")
} else if exam1Score > 80 {
    print("A")
} else if exam1Score > 70 {
    print("A-")
} else if exam1Score > 60 {
    print("B")
} else if exam1Score > 50 {
    print("C")
} else if exam1Score > 40 {
    print("D")
} else if exam1Score > 30 {
    print("E")
} else if exam1Score > 20 {
    print("F")
} else if exam1Score > 10 {
    print("F")
} else {
    print("F")
}


//:
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
