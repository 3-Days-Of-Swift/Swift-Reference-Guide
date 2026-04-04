//: ## ![www.3DaysOfSwift.com](ss-in-content-logo.png) Calculator Solution
//:
//: Below is our solution to creating a small and basic calculator.
//:
//: 👉 Execute the code below. The result of the math equation will be printed to the console.
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

import Darwin // includes math functions i.e. pow(a, b)
class EquationBuilder {
    // MARK: - Operation Side Enum

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
        currentDecimalPlaces += 1
        let base10Column = Decimal(pow(10.0, Double(currentDecimalPlaces)))
        let newDecimalNumber = Decimal(number) / base10Column
        return previousInput + newDecimalNumber
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
        equationBuilder.add()
    }

    func minusPressed() {
        equationBuilder.subtract()
    }

    func multiplyPressed() {
        equationBuilder.multiply()
    }

    func dividePressed() {
        equationBuilder.divide()
    }

    func equalsPressed() {
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
    
    let decimalSymbol = "."
    
    var textToDisplay: String {
        let currentDecimalPlaces = equationBuilder.currentDecimalPlaces
        let isEnteringDecimal = equationBuilder.isEnteringDecimal
        
        // display the final result
        if let result {
            return result.formatted()
        }
        
        // No result: Display the operand being entered
        // Try the right hand side operand first
        if let rightHandOperand {
            return formatOperandForDisplay(rightHandOperand, isEnteringDecimal: isEnteringDecimal, decimalPlaces: currentDecimalPlaces)
        }
        
        // No right hand side operand: So display the left hand side operand
        return formatOperandForDisplay(leftHandOperand, isEnteringDecimal: isEnteringDecimal, decimalPlaces: currentDecimalPlaces)
    }

    
    private func formatOperandForDisplay(_ decimal: Decimal, isEnteringDecimal: Bool, decimalPlaces: Int) -> String {
        return decimal.formatted()
    }
    /**
    This method exists to solve the following problem; Imagine the user enters 1. or 1.00. In this scenario we would NOT want to display 1 or 1.0 to the user. Instead, we want to display the values entered which can no longer be represented numerically
     */
//    private func formatOperandForDisplay(_ decimal: Decimal, isEnteringDecimal: Bool, decimalPlaces: Int) -> String {
//        guard decimal.isNaN == false else {
//            return "Error: Not a number"
//        }
//
//        let formattedNumber = decimal.formatted()
//        guard isEnteringDecimal else {
//            return formattedNumber
//        }
//        
//        let formattedNumberWithDecimal = applyDecimalToStringIfNeeded(formattedNumber)
//        let numberOfNonZeroDecimalPlaces = formattedNumberWithDecimal.components(separatedBy: decimalSymbol).last?.count ?? 0
//
//        var displayText = formattedNumberWithDecimal
//        let numberOfZerosToPrint = decimalPlaces - numberOfNonZeroDecimalPlaces
//        for _ in 0 ..< numberOfZerosToPrint {
//            displayText.append("0")
//        }
//        return displayText
//    }
//    
//    private func applyDecimalToStringIfNeeded(_ string: String) -> String {
//        if string.contains(decimalSymbol) {
//            return string
//        }
//        return string.appending(decimalSymbol)
//    }
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

// MARK: - Using Our Example

// 👉 Let's test our system!
// 1️⃣ EQUATION NUMBER 1
// Equation: 123.5 * 45.8 = 5,656.3

let ui = UserInterface()

// 123.5
ui.onePressed()
ui.twoPressed()
ui.threePressed()
ui.decimalPressed()
ui.fivePressed()

// 123.5 *
ui.multiplicationPressed()

// 123.5 * 45.8
ui.fourPressed()
ui.fivePressed()
ui.decimalPressed()
ui.eightPressed()

// 123.5 * 45.8 = 5,656.3
ui.equalsPressed() // displays result 5,656.3


// 👉 Let's try something harder!
// 2️⃣ EQUATION NUMBER 2
// Equation: 123.005 * 45.8 = 5,633.629
ui.clearPressed()

// 123.005
ui.onePressed();
ui.twoPressed()
ui.threePressed()
ui.decimalPressed() // 💭   where is the decimal dot?
ui.zeroPressed()    // 🤔💭 where is the decimal zero? 123.0
ui.zeroPressed()    // 🤨💭 where is the decimal zero? 123.00
ui.fivePressed()

// 123.005 *
ui.multiplicationPressed()

// 123.005 * 45.8
ui.fourPressed()
ui.fivePressed()
ui.decimalPressed()
ui.eightPressed()

// 123.005 * 45.8 = 5,633.629
ui.equalsPressed() // displays result 5,633.629


//:
//: -------------------
//:
//: ![3 Days Of Swift.com](3DaysOfSwiftLogo-header.png)
//:
//: [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [Email Us](mailto:helloworld@3daysofswift.com?subject=Hello)
//:
//: Ready to start learning Swift? [Yes ✅](https://www.3DaysOfSwift.com)
//:
/*:
 */
//: -------------------
//:
/*:
 */
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) students!
