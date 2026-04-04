//: ## Task 1
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


// 1. How to combine numbers with a keypad button press
import Foundation // includes Decimal

var leftHandOperand: Decimal = 0
func numberPressed(_ number: Decimal) -> Decimal {
    // Shift existing digits left by 1 column
    // This is the same as multiplying by 10
    let base10Multiiplier: Decimal = 10
    leftHandOperand = (leftHandOperand * base10Multiiplier) + number
    return leftHandOperand
}

numberPressed(1)
numberPressed(2)
numberPressed(3)


//:
//: -------------------
/*:
 */
//: ## Task 1 - Full Solution
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
