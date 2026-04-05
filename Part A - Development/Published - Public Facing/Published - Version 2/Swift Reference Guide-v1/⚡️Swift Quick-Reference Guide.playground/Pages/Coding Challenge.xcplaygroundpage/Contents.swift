//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com)
//:
//: -------------------
//:
//: ## Coding Challenge
//: ## 🧑🏿‍💻👩🏼‍💻👨🏾‍💻 ⚔️
//:
//: Given some initial source code, add the missing features (as many as you can) to match the functionality of the macOS Calculator.app.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous) 
//:
//: -------------------
//:
//: ![The macOS calculator app](CalculatorAppUI.png)
//:
//: -------------------
//:
//: Study Swift language features at [3DaysOfSwift.com](https://www.3DaysOfSwift.com).
//:
//: Built for professionals who need to understand a commercial codebase.
//:
//: -------------------
//:
/*:
 */
//:
//: ### Task 1
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
//: ###  Task 2
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
//: ###  Task 3
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


// MARK: Calculator Source Code
import Foundation // Contains Decimal
import Darwin     // includes pow()

// MARK: - 📦 Layer 0 - Swift Language Extensions

extension Array {
    subscript (safe index: Int) -> Element? {
        (index >= 0 && count > index) ? self[index] : nil
    }
}

extension Decimal {
    var numberOfDecimalPlaces: Int {
        return max(-exponent, 0)
    }
}

// MARK: - 📦 Layer 1 - Equation

enum MathOperation {
    case add
    case subtract
    case multiply
    case divide
}

struct MathEquation {
    var leftHandSide: Decimal = 0
    var rightHandSide: Decimal?
    var operation: MathOperation?
    var result: Decimal?
    
    mutating func execute() -> Decimal? {
        if
            let operation = self.operation,
            let rightHandSide = self.rightHandSide {
            
            switch operation {
            case .add:
                result = leftHandSide + rightHandSide
            case .subtract:
                result = leftHandSide - rightHandSide
            case .multiply:
                result = leftHandSide * rightHandSide
            case .divide:
                result = leftHandSide / rightHandSide
            }
            return result
        }
        return nil
    }
}

// MARK: - 📦 Layer 2 - EquationBuilder

class EquationBuilder {

    enum KeyPadInput: Int {
        case zero = 0
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
    }
    
    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }
    
    private(set) var equation = MathEquation()
    private var editingSide: OperandSide = .leftHandSide
    private(set) var isEnteringDecimal = false
    private(set) var currentDecimalPlaces = 0
    var result: Decimal? {
        return equation.result
    }
    var leftHandOperand: Decimal {
        return equation.leftHandSide
    }
    var rightHandOperand: Decimal? {
        return equation.rightHandSide
    }
    
    init() {
        
    }

    init (_ equation: MathEquation) {
        self.equation = equation
        if equation.operation != nil {
            editingSide = .rightHandSide
        }
        
        if let rhs = equation.rightHandSide {
            currentDecimalPlaces = rhs.numberOfDecimalPlaces
        } else {
            currentDecimalPlaces = equation.leftHandSide.numberOfDecimalPlaces
        }
        isEnteringDecimal  = currentDecimalPlaces > 0 ? true : false
    }
    
    func decimalPressed() {
        isEnteringDecimal = true
        if editingSide == .rightHandSide,
           equation.rightHandSide == nil
        {
            equation.rightHandSide = Decimal(0)
        }
    }

    func selectOperation(operation: MathOperation) {
        equation.operation = operation
        editingSide = .rightHandSide
        currentDecimalPlaces = 0
        isEnteringDecimal = false
        startEditingRightHandSide()
    }

    func execute() {
        equation.execute()
    }
    
    func enterNumber(_ number: KeyPadInput) {
        switch editingSide {
        case .leftHandSide:
            let previousInput = equation.leftHandSide
            equation.leftHandSide = appendNewNumber(number.rawValue, toPreviousEntry: previousInput)
        case .rightHandSide:
            let previousInput = equation.rightHandSide ?? Decimal.zero
            equation.rightHandSide = appendNewNumber(number.rawValue, toPreviousEntry: previousInput)
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

    private func startEditingRightHandSide() {
        editingSide = .rightHandSide
        isEnteringDecimal = false
        currentDecimalPlaces = 0
    }
}

// MARK: - 📦 Layer 3 - Calculator

class Calculator {
    private var equationBuilder: EquationBuilder = EquationBuilder()
    private(set) var historicalLog: [MathEquation] = []
    var result: Decimal? {
        return equationBuilder.result
    }
    var leftHandOperand: Decimal {
        return equationBuilder.leftHandOperand
    }
    var rightHandOperand: Decimal? {
        return equationBuilder.rightHandOperand
    }
    
    func clear() -> String {
        equationBuilder = EquationBuilder()
        return textToDisplay
    }
    
    func enterDecimalState() -> String {
        equationBuilder.decimalPressed()
        return textToDisplay
    }
    
    func enterZero() -> String {
        equationBuilder.enterNumber(.zero)
        return textToDisplay
    }
    
    func enterOne() -> String {
        equationBuilder.enterNumber(.one)
        return textToDisplay
    }
    
    func enterTwo() -> String {
        equationBuilder.enterNumber(.two)
        return textToDisplay
    }
    
    func enterThree() -> String {
        equationBuilder.enterNumber(.three)
        return textToDisplay
    }
    
    func enterFour() -> String {
        equationBuilder.enterNumber(.four)
        return textToDisplay
    }
    
    func enterFive() -> String {
        equationBuilder.enterNumber(.five)
        return textToDisplay
    }
    
    func enterSix() -> String {
        equationBuilder.enterNumber(.six)
        return textToDisplay
    }
    
    func enterSeven() -> String {
        equationBuilder.enterNumber(.seven)
        return textToDisplay
    }
    
    func enterEight() -> String {
        equationBuilder.enterNumber(.eight)
        return textToDisplay
    }
    
    func enterNine() -> String {
        equationBuilder.enterNumber(.nine)
        return textToDisplay
    }
    
    func add() -> String {
        equationBuilder.selectOperation(operation: .add)
        return textToDisplay
    }
    
    func subtract() -> String {
        equationBuilder.selectOperation(operation: .subtract)
        return textToDisplay
    }
    
    func multiply() -> String {
        equationBuilder.selectOperation(operation: .multiply)
        return textToDisplay
    }
    
    func division() -> String {
        equationBuilder.selectOperation(operation: .divide)
        return textToDisplay
    }
    
    func execute() -> String {
        if equationBuilder.result == nil {
            equationBuilder.execute()
            historicalLog.append(equationBuilder.equation)
        }
        
        return textToDisplay
    }
    
    func reviveHistoricalEquation(atIndex index: Int) {
        if let previousEquation = historicalLog[safe: index] {
            equationBuilder = EquationBuilder(previousEquation)
        }
    }
}

// MARK: Visual Display for Xcode Playground
extension Calculator {
    
    private var localizedDecimalSymbol: String {
        // changes in different countries
        return Locale.current.decimalSeparator ?? "."
    }
    
    var textToDisplay: String {
        // display the final result
        if let result = self.result {
            return result.formatted()
        }
        
        // No result: Display the operand being entered
        let currentDecimalPlaces = equationBuilder.currentDecimalPlaces
        let isEnteringDecimal = equationBuilder.isEnteringDecimal
        
        // Try the right hand side operand first
        if let rightHandOperand = self.rightHandOperand {
            return formatOperandForDisplay(rightHandOperand, isEnteringDecimal: isEnteringDecimal, numberOfTrailingZerosToPrint: currentDecimalPlaces - rightHandOperand.numberOfDecimalPlaces)
        }
        
        // No right hand side operand: So display the left hand side operand
        return formatOperandForDisplay(leftHandOperand, isEnteringDecimal: isEnteringDecimal, numberOfTrailingZerosToPrint: currentDecimalPlaces - leftHandOperand.numberOfDecimalPlaces)
    }
    
    /**
    This method exists to solve the following problem; Imagine the user enters 1. or 1.00. In this scenario we would NOT want to display 1 or 1.0 to the user. Instead, we want to display the values entered which can no longer be represented numerically
     */
    private func formatOperandForDisplay(_ decimal: Decimal, isEnteringDecimal: Bool, numberOfTrailingZerosToPrint: Int) -> String {
        guard decimal.isNaN == false else {
            return "NaN"
        }
        
        let formattedNumber = decimal.formatted()
        guard isEnteringDecimal else {
            return formattedNumber
        }

        var displayText = applyDecimalToStringIfNeeded(formattedNumber)
        for _ in 0..<numberOfTrailingZerosToPrint {
            displayText.append("0")
        }
        return displayText
    }

    private func applyDecimalToStringIfNeeded(_ string: String) -> String {
        let decimalSymbol = localizedDecimalSymbol
        if string.contains(decimalSymbol) {
            return string
        }
        return string.appending(decimalSymbol)
    }
}

// MARK: - Layer 4 - UI (User Interface)

class UserInterface {
    private let calc = Calculator()

    func zeroPressed() -> String {
        calc.enterZero()
    }

    func onePressed() -> String {
        calc.enterOne()
    }

    func twoPressed() -> String {
        calc.enterTwo()
    }

    func threePressed() -> String {
        calc.enterThree()
    }

    func fourPressed() -> String {
        calc.enterFour()
    }

    func fivePressed() -> String {
        calc.enterFive()
    }

    func sixPressed() -> String {
        calc.enterSix()
    }

    func sevenPressed() -> String {
        calc.enterSeven()
    }

    func eightPressed() -> String {
        calc.enterEight()
    }

    func ninePressed() -> String {
        calc.enterNine()
    }

    func decimalPressed() -> String {
        calc.enterDecimalState()
    }

    func addPressed() -> String {
        calc.add()
    }
    
    func subtractPressed() -> String {
        calc.subtract()
    }
    
    func multiplyPressed() -> String {
        calc.multiply()
    }

    func dividePressed() -> String {
        calc.division()
    }
    
    func equalsPressed() -> String {
        calc.execute()
    }

    func clearPressed() -> String {
        calc.clear()
    }
    
    func reviveHistoricalEquation(atIndex index: Int) {
        calc.reviveHistoricalEquation(atIndex: index)
    }
}

// MARK: - 🧪 Layer 5 - System Testing - Calculator Interface

func test(_ expectedResult: Decimal, actualResult: Decimal?) -> String {
    let successMessage = "✅ Test Passed"
    let failureMessage = "❌ Test Failed"
    var message: String
    if expectedResult == actualResult {
        message = successMessage
    } else {
        message = failureMessage
    }
    
    print(message)
    return message
}

let calc = Calculator() // SUT - System Under Test
calc.enterNine()
calc.multiply()
calc.enterFour()
calc.execute()
test(36, actualResult: calc.result)

calc.clear()

calc.enterTwo()
calc.multiply()
calc.enterNine()
calc.execute()
test(18, actualResult: calc.result)

calc.reviveHistoricalEquation(atIndex: 0)
calc.execute()
test(36, actualResult: calc.result)

calc.clear()

calc.enterOne()
calc.enterTwo()
calc.enterThree()
calc.enterDecimalState()
calc.enterOne()
calc.enterTwo()
calc.enterThree()
calc.multiply()
calc.enterTwo()
calc.execute()
test(Decimal(string: "246.246")!, actualResult: calc.result)

calc.clear()

calc.enterOne()
calc.enterZero()
calc.enterZero()
calc.division()
calc.enterZero()
calc.execute()
test(Decimal.nan, actualResult: calc.result)

// MARK: 🧪 Layer 5 - UI Testing - Xcode Playground UI

func test(_ expectedResult: String, actualResult: String) -> String {
    let successMessage = "✅ Test Passed"
    let failureMessage = "❌ Test Failed"
    var message: String
    if expectedResult == actualResult {
        message = successMessage
    } else {
        message = failureMessage
    }
    
    print(message)
    return message
}

let ui = UserInterface()
ui.ninePressed()
ui.multiplyPressed()
ui.fourPressed()
test("36", actualResult: ui.equalsPressed())

ui.clearPressed()

ui.twoPressed()
ui.multiplyPressed()
ui.ninePressed()
test("18", actualResult: ui.equalsPressed())

ui.reviveHistoricalEquation(atIndex: 0)
test("36", actualResult: ui.equalsPressed())

ui.clearPressed()

ui.onePressed()
ui.twoPressed()
ui.threePressed()
ui.decimalPressed()
ui.onePressed()
ui.twoPressed()
ui.threePressed()
ui.multiplyPressed()
ui.twoPressed()
test("246.246", actualResult: ui.equalsPressed())

ui.clearPressed()

ui.onePressed()
ui.decimalPressed()
ui.zeroPressed()
ui.zeroPressed()
ui.zeroPressed()
ui.onePressed()
ui.multiplyPressed()
ui.twoPressed()
test("2.0002", actualResult: ui.equalsPressed())

ui.clearPressed()

ui.onePressed()
ui.zeroPressed()
ui.zeroPressed()
ui.dividePressed()
ui.zeroPressed()
test("NaN", actualResult: ui.equalsPressed())


//:
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
//: [◀  Previous Page](@previous)
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
