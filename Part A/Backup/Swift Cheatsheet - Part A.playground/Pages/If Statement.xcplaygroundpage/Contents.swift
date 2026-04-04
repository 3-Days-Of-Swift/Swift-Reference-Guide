//: ## ![The Swift Logo](swiftLogo43.png) If Statement
//:
//: If statements allow us to change the path of code execution based on some condition.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


var studentPassed = false
let exam1Score: Int = 50
if exam1Score > 50 {
    studentPassed = true
}


//:
//: -------------------
//:
//: ## Conditions
//:
//: To execute the branch of code each if statement condition must evaluate to `true`.
//:
//: -------------------
//:


if (true) {
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
