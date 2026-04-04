//: ##  Task 4
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

// 1. Code enhancement - Calculating decimal places
// MARK: - 📦 Layer 0 - Swift Language Extensions

extension Decimal {
    var significantFractionalDecimalDigits: Int {
        return max(-exponent, 0)
    }
}

Decimal(1230).significantFractionalDecimalDigits
Decimal(0.123).significantFractionalDecimalDigits
Decimal(0.1230).significantFractionalDecimalDigits
Decimal(0.12300).significantFractionalDecimalDigits

// 2. How to edit the equalsPressed() function
//func equalsPressed() {
//    if
//        equationBuilder.isCompleted,
//        let result = result,
//        let operation = operation,
//        let rightHandOperand = rightHandOperand
//    {
//        var newEquationBuilder = EquationBuilder()
//        newEquationBuilder.lhs = result
//        newEquationBuilder.operation = operation
//        newEquationBuilder.rhs = rightHandOperand
//        equationBuilder = newEquationBuilder
//    }
//
//    guard equationBuilder.isReadyToExecute else {
//        return
//    }
//    
//    equationBuilder.execute()
//}

// 3. How to fix a bug 🐛 in the code


//:
//: -------------------
/*:
 */
//: ## Task 4 - Full Solution
//:
//: Below is the source code.
/*:
 */
//: -------------------


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

    var isCompleted: Bool {
        equation.result == nil ? false : true
    }
    
    var isReadyToExecute: Bool {
        equation.operation != nil && equation.rhs != nil ? true : false
    }
    
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
        guard isEnteringDecimal == false else {
            return appendNewDecimal(number, toPreviousEntry: previousInput)
        }
        // shift existing base 10 numbers left by column (* 10)
        return (previousInput * 10) + Decimal(number)
    }

    private func appendNewDecimal(_ number: Int, toPreviousEntry previousInput: Decimal) -> Decimal {
        currentDecimalPlaces += 1
        let base10Column = Decimal(pow(10.0, Double(currentDecimalPlaces)))
        let newDecimalNumber = Decimal(number) / base10Column
        return previousInput + newDecimalNumber
    }

    var result: Decimal? {
        return equation.result
    }
    
    // for external use only
    var lhs: Decimal {
        get {
            return equation.lhs
        } set {
            equation.lhs = newValue
            rhs = nil
            editingSide = .leftHandSide
            currentDecimalPlaces = newValue.significantFractionalDecimalDigits
            isEnteringDecimal = currentDecimalPlaces > 0 ? true : false
        }
    }
    
    // for external use only
    var rhs: Decimal? {
        get {
            return equation.rhs
        } set {
            equation.rhs = newValue
            editingSide = .rightHandSide
            currentDecimalPlaces = newValue?.significantFractionalDecimalDigits ?? 0
            isEnteringDecimal = currentDecimalPlaces > 0 ? true : false
        }
    }
    
    // for external use only
    var operation: MathOperation? {
        get {
            return equation.operation
        }
        set {
            equation.operation = newValue
            startEditingRightHandSide()
        }
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
        
        // Bug fix 🐛
        if equationBuilder.isCompleted {
            equationBuilder = EquationBuilder()
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
        if 
            equationBuilder.isCompleted,
            let result = result,
            let operation = operation,
            let rightHandOperand = rightHandOperand
        {
            var newEquationBuilder = EquationBuilder()
            // the order of setting values MUST BE PRESERVED in the order a user would enter them.
            newEquationBuilder.lhs = result
            newEquationBuilder.operation = operation
            newEquationBuilder.rhs = rightHandOperand
            equationBuilder = newEquationBuilder
        }

        guard equationBuilder.isReadyToExecute else {
            return
        }
        
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
    
    var operation: MathOperation? {
        equationBuilder.operation
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

    /**
    This method exists to solve the following problem; Imagine the user enters 1. or 1.00. In this scenario we would NOT want to display 1 or 1.0 to the user. Instead, we want to display the values entered which can no longer be represented numerically
     */
    private func formatOperandForDisplay(_ decimal: Decimal, isEnteringDecimal: Bool, decimalPlaces: Int) -> String {
        guard decimal.isNaN == false else {
            return "Error: Not a number"
        }

        let formattedNumber = decimal.formatted()
        guard isEnteringDecimal else {
            return formattedNumber
        }

        let formattedNumberWithDecimal = applyDecimalToStringIfNeeded(formattedNumber)
        let numberOfNonZeroDecimalPlaces = decimal.significantFractionalDecimalDigits // code enhancement 💪

        var displayText = formattedNumberWithDecimal
        let numberOfZerosToPrint = decimalPlaces - numberOfNonZeroDecimalPlaces
        for _ in 0 ..< numberOfZerosToPrint {
            displayText.append("0")
        }
        return displayText
    }

    private func applyDecimalToStringIfNeeded(_ string: String) -> String {
        if string.contains(decimalSymbol) {
            return string
        }
        return string.appending(decimalSymbol)
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

// SECOND EQUATION: 2 * 2 = = = 16
ui.clearPressed()

ui.twoPressed()
ui.multiplicationPressed()
ui.twoPressed()
ui.equalsPressed() // 2 * 2 = 4
ui.equalsPressed() // 4 * 2 = 8
ui.equalsPressed() // 8 * 2 = 16

// Found a bug 🐛
ui.twoPressed()
ui.multiplicationPressed()
ui.threePressed()
ui.equalsPressed()
