//: ## ![The Swift Logo](swiftLogo128.png) 🤥 The Swift Cheatsheet
//: ## Coding Challenge
//: ## 🧑🏿‍💻👩🏼‍💻👨🏾‍💻 ⚔️
//:
//: [Watch Solution Videos](https://www.3daysofswift.com)
//:
//: Given some initial source code, add the missing features (as many as you can) to match the functionality of the macOS Calculator.app.
//:
//: ![The macOS calculator app](CalculatorAppUI.png)
//:
//: -------------------
/*:
 */
//: ##  Tasks
//: [Video solutions](https://www.3daysofswift.com) are apart of our [3 Days Of Swift](https://www.3daysofswift.com) course.
//: ### Task 1
//:
//: 👉 Each operands (left and right) are entered via a 10 digit keypad with numbers `0` - `9`.
//:
//: Amend the source code to add the following functionality; Pressing `1` followed by `2` results in `12`. Do this for all whole numbers ignoring decimal values.
//:
//: ![The macOS calculator app](CalculatorAppUI_12.png)
//:
//: Execute the math equation `123 + 123 = 246`.
//:
//: -------------------
/*:
 */
//: ### Task 2
//:
//: 👉 Pressing the decimal button should result in all numbers being entered being of a fractional value.
//:
//: Amend the source code to add the following functionality; Pressing `1` followed by `.` followed by `2` followed by `3` results in `1.23`.
//:
//: ![The macOS calculator app](CalculatorAppUI_1_23.png)
//:
//: Execute the math equation `12.123 + 12.123 = 24.246`.
//:
//: -------------------
/*:
 */
//: ### Task 3
//:
//: 👉 With each input the calculator returns a `String` value for the display. This is displayed in the right-hand variable panel and is used as the UI (User Interface).
//:
//: Amend the source code to add the following functionality; Match the display of the Calculator.app. As the user enters the value `0.00` the calculator will print "`0`", followed by "`0.`", and then "`0.0`" and finally "`0.00`".
//:
//: ![The macOS calculator app](CalculatorAppUI_000_5.png)
//:
//: ![The right-hand variable panel](RightPanelDisplay_005.png)
/*:
 */
//: Execute the math equation `0.005 * 0.005 = 0.000025`.
//:
//: -------------------
/*:
 */
//: ###  Task 4
//:
//: 👉 Repeatedly pressing the equals button should continue to apply the operation (and right hand operand) to the result of the last equation.
//:
//: Alter the equals button function to include this feature. After the user executes the equation `10 + 3` pressing equals will continuously add `3` to the result.
//:
//: ![The macOS calculator app](CalculatorAppUI_Equals_1.png)
//:
//: Execute the math equation `2 * 2`. Press equals twice. The answer is `16`.
//:
//: -------------------
/*:
 */
//: ###  Task 5
//:
//: 👉 Repeatedly pressing a math operation button should execute the equation and set the result and operation as input for the next equation.
//:
//: ![The macOS calculator app](CalculatorAppUI_Operator_1.png)
//:
//: Execute the math equation `2 * 2 * 4 * 8`. The answer is `128`.
//:
//: -------------------
/*:
 */
//: ###  Extra Credit! 👨🏻‍🏫 🧑🏿‍💻👩🏼‍💻👨🏾‍💻
//: ###  Task 6
//:
//: Write the code to add the functionality of the percentage and negate buttons.
//:
//: -------------------
/*:
 */
//: ## The Source Code 
//:
//: Complete each task by amending the source code below.
//:
//: ## 👇
//:
//: -------------------
//:


// MARK: - Calculator Source Code

import Foundation // includes Decimal

// MARK: - 📦 Layer 1 - Equation

enum MathOperation {
    case add
    case subtract
    case divide
    case multiply
}

struct MathEquation {
    var lhs: Decimal = 0
    var rhs: Decimal?
    var result: Decimal?
    var operation: MathOperation?

    mutating func execute() {
        guard let operation,
              let rhs
        else {
            return
        }
        switch operation {
        case .add: result = lhs + rhs
        case .subtract: result = lhs - rhs
        case .divide: result = lhs / rhs
        case .multiply: result = lhs * rhs
        }
    }
}

// MARK: 📦 Layer 2 - EquationBuilder

import Darwin // includes pow(a, b)

class EquationBuilder {
    
    // MARK: - Operand Side

    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }

    // MARK: - variables

    private var equation = MathEquation()
    private var editingSide: OperandSide = .leftHandSide
    private(set) var isEnteringDecimal = false
    private(set) var currentDecimalPlaces = 0

    // MARK: - Decimal Numbers

    func applyDecimalPoint() {
        isEnteringDecimal = true
        if editingSide == .rightHandSide,
           equation.rhs == nil
        {
            equation.rhs = Decimal(0)
        }
    }

    // MARK: - Math Operations

    func divide() {
        equation.operation = .divide
        startEditingRightHandSide()
    }

    func add() {
        equation.operation = .add
        startEditingRightHandSide()
    }

    func subtract() {
        equation.operation = .subtract
        startEditingRightHandSide()
    }

    func multiply() {
        equation.operation = .multiply
        startEditingRightHandSide()
    }

    func execute() {
        equation.execute()
    }

    func enterNumber(_ number: Int) {
        switch editingSide {
        case .leftHandSide:
            let previousInput = equation.lhs
            equation.lhs = appendNewNumber(number, toPreviousEntry: previousInput)
        case .rightHandSide:
            let previousInput = equation.rhs ?? Decimal.zero
            equation.rhs = appendNewNumber(number, toPreviousEntry: previousInput)
        }
    }

    private func appendNewNumber(_ number: Int, toPreviousEntry previousInput: Decimal) -> Decimal {
        // TODO: TASK 1: Replace this code. Shift existing base 10 numbers left by one column i.e. multiply by 10
        return previousInput + Decimal(number)
    }

    private func appendNewDecimal(_ number: Int, toPreviousEntry previousInput: Decimal) -> Decimal {
        // TODO: TASK 2: Replace this code. Shift new input right by one base 10 column i.e. divide input by 10
        return previousInput + Decimal(number)
    }

    var result: Decimal? {
        return equation.result
    }
    
    var lhs: Decimal {
        return equation.lhs
    }
    
    var rhs: Decimal? {
        return equation.rhs
    }

    private func startEditingRightHandSide() {
        editingSide = .rightHandSide
        isEnteringDecimal = false
        currentDecimalPlaces = 0
    }
}

// MARK: - 📦 Layer 3 - Calculator

class Calculator {
    private var equationBuilder = EquationBuilder()

    // MARK: - Calculator API

    func clearPressed() {
        equationBuilder = EquationBuilder()
    }

    func numberPressed(_ number: Int) {
        guard number >= 0,
              number <= 9 else {
            return
        }
        equationBuilder.enterNumber(number)
    }

    func decimalPressed() {
        equationBuilder.applyDecimalPoint()
    }

    func addPressed() {
        // TODO: Task 5: Add code to execute the equation if it is complete and ready to be executed. Then set the new left hand operand to the result of the equation. Set the last used math operation also.
        equationBuilder.add()
    }

    func minusPressed() {
        // TODO: Task 5: Add code to execute the equation if it is complete and ready to be executed. Then set the new left hand operand to the result of the equation. Set the last used math operation also.
        equationBuilder.subtract()
    }

    func multiplyPressed() {
        // TODO: Task 5: Add code to execute the equation if it is complete and ready to be executed. Then set the new left hand operand to the result of the equation. Set the last used math operation also.
        equationBuilder.multiply()
    }

    func dividePressed() {
        // TODO: Task 5: Add code to execute the equation if it is complete and ready to be executed. Then set the new left hand operand to the result of the equation. Set the last used math operation also.
        equationBuilder.divide()
    }

    func equalsPressed() {
        // TODO: Task 4: Add code to re-apply the same operation to the existing result. But only if the equation has already been executed.
        equationBuilder.execute()
    }
    
    var result: Decimal? {
        equationBuilder.result
    }
    
    var leftHandOperand: Decimal {
        equationBuilder.lhs
    }
    
    var rightHandOperand: Decimal? {
        equationBuilder.rhs
    }

    // MARK: - Visual Display
    
    let decimalSymbol = "." // changes in different countries
    
    var textToDisplay: String {
        // display the final result
        if let result {
            return result.formatted()
        }
        
        // No result: Display the operand being entered
        let currentDecimalPlaces = equationBuilder.currentDecimalPlaces
        let isEnteringDecimal = equationBuilder.isEnteringDecimal
        
        // Try the right hand side operand first
        if let rightHandOperand {
            return formatOperandForDisplay(rightHandOperand, isEnteringDecimal: isEnteringDecimal, decimalPlaces: currentDecimalPlaces)
        }
        
        // No right hand side operand: So display the left hand side operand
        return formatOperandForDisplay(leftHandOperand, isEnteringDecimal: isEnteringDecimal, decimalPlaces: currentDecimalPlaces)
    }

    private func formatOperandForDisplay(_ decimal: Decimal, isEnteringDecimal: Bool, decimalPlaces: Int) -> String {
        // TODO: Task 3: Replace this code. Calculate if we should append a decimal character to the value. Calculate if we should append zeros to the value.
        return decimal.formatted()
    }
}

// MARK: - 📦 Layer 4 - UI (User Interface)

class UserInterface {
    private let calc = Calculator()
    private var textToDisplay = ""

    // functions connected to UI buttons
    func refreshDisplay() {
        textToDisplay = calc.textToDisplay
    }

    // numeric keyboard

    func zeroPressed() -> String {
        numberPressed(0)
        return textToDisplay
    }

    func onePressed() -> String {
        numberPressed(1)
        return textToDisplay
    }

    func twoPressed() -> String {
        numberPressed(2)
        return textToDisplay
    }

    func threePressed() -> String {
        numberPressed(3)
        return textToDisplay
    }

    func fourPressed() -> String {
        numberPressed(4)
        return textToDisplay
    }

    func fivePressed() -> String {
        numberPressed(5)
        return textToDisplay
    }

    func sixPressed() -> String {
        numberPressed(6)
        return textToDisplay
    }

    func sevenPressed() -> String {
        numberPressed(7)
        return textToDisplay
    }

    func eightPressed() -> String {
        numberPressed(8)
        return textToDisplay
    }

    func ninePressed() -> String {
        numberPressed(9)
        return textToDisplay
    }

    private func numberPressed(_ number: Int) {
        calc.numberPressed(number)
        refreshDisplay()
    }
    
    // decimal point
    func decimalPressed() -> String {
        calc.decimalPressed()
        refreshDisplay()
        return textToDisplay
    }

    // math operations
    func addPressed() -> String {
        calc.addPressed()
        refreshDisplay()
        return textToDisplay
    }

    func minusPressed() -> String {
        calc.minusPressed()
        refreshDisplay()
        return textToDisplay
    }

    func divisionPressed() -> String {
        calc.dividePressed()
        refreshDisplay()
        return textToDisplay
    }

    func multiplicationPressed() -> String {
        calc.multiplyPressed()
        refreshDisplay()
        return textToDisplay
    }

    // equals
    func equalsPressed() -> String {
        calc.equalsPressed()
        refreshDisplay()
        return textToDisplay
    }

    // extra functions
    func clearPressed() {
        calc.clearPressed()
        refreshDisplay()
    }
}

// MARK: - Using Our Calc Software

// 👉 Our calculator is UNFINISHED 😞
// Complete the tasks & fix the bugs 🐛
// Equation: 123.5 * 0.005 = 0.6175

let ui = UserInterface()

// 123.5
ui.onePressed()
ui.twoPressed()
ui.threePressed()
ui.decimalPressed()
ui.fivePressed()

// 123.5 *
ui.multiplicationPressed()

// 123.5 * 0.005
ui.zeroPressed()
ui.decimalPressed()
ui.zeroPressed()
ui.zeroPressed()
ui.fivePressed()

// 123.5 * 0.005 = 0.6175
ui.equalsPressed() // displays result 0.6175


//:
//: -------------------
//:
//: ## Our Solution Workbook
//:
//: We have supplied our full solution in the `The Swift Cheatsheet - Coding Challenge - Workbook.playground` file in the same directory as this Xcode playground file.
//:
//: Open our workbook to follow each solution to each task.
//:
//: Watch the online solution videos on our online course [3 Days Of Swift](https://www.3daysofswift.com)
//:
//: There is no "correct" solution, so enjoy noticing the differences between our two solutions. 😊
/*:
 
 */
//: -------------------
//:
//: ## Email Us Your Solution! 🥰
//: [Email Us](mailto:helloworld@3daysofswift.com?subject=A%20Sneak%20Peak%20Into%20Swift%20-%20Your%20Next%20Student)
//: We want to see your solution!
//:
//: [helloworld@3daysofswift.com](mailto:helloworld@3daysofswift.com?subject=A%20Sneak%20Peak%20Into%20Swift%20-%20Your%20Next%20Student)
//:
//: We love receiving emails... so please email us your solution. We'd love to see your progress and help cheer you on! 👏🏻 👏🏽 👏🏿
//:
//: -------------------
//:
//: ## Want to Learn Swift? 🧑🏼‍💻👨🏽‍💻👩🏿‍💻
//:
//: Learn Swift in 3 days!
//:
//: Have you considered dedicating a weekend to learning Swift?
//:
//: Why not take our 3-day [online weekend crash course](https://www.3DaysOfSwift.com) and learn how to write code to the standard of a Swift Engineer writing code at an entry level position?
//:
//:
//: [View online course](https://www.3DaysOfSwift.com)
/*:
 
 */
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
//: [◀  Previous Page](@previous)
//:
//: -------------------
//:
//: ## ![](3DaysIcon128.png) 3 Days Of Swift
//:
//: © Copyright. All rights reserved.
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) students!
