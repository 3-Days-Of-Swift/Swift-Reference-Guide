//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [The 3 Days of Swift](https://www.3DaysOfSwift.com/3days)
//:
//: -------------------
//:
//: ## Variables
//:
//: Variables store values. Swift has two types of Variable.
//:
//: * `var` creates a variable. The stored value can change.
//:
//: * `let` creates a constant. The value can **not** change.
//:
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------


var myVariable: String = "Some text"
myVariable = "Different text"

let myConstant: String = "Some text"
//myConstant = "Different text"


//:
//: -------------------
//:
//: ## Initial Values
//:
//: Variables can set an initial value on the same line they're declared.
//:
//: -------------------
//:


let initialValue: String = "Some text"


//:
//: -------------------
//:
//: ## Type Inference
//:
//: When an initial value is set on a variable the compiler can infer its type.
//:
//: This is called "Type Inference".
//:
//: -------------------
//:


let initialValue2 = "Some text"


//:
//: -------------------
//:
//: ## Variable Names
//:
//: Variable names should describe the data they represent.
//:
//: Keep names short to reduce typing.
//:
//: -------------------
//:


// acceptable variable names
let scienceExamScore = 50 // camelCase
let examScore = 50
let examResult = 50
let exam1Score = 50

// unacceptable variable names
let theExamScore = 50
let 👨🏻‍🏫Score = 50
let totalOfOverallScienceModuleExamScore = 50
let science_module_exam_score = 50 // snake_case
//let 1ExamScore = 50


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
//: [Website](https://www.3DaysOfSwift.com) | [The 3 Days Of Swift](https://www.3DaysOfSwift.com/3days)
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
