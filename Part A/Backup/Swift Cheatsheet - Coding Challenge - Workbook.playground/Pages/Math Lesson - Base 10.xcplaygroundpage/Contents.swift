// 1. How to use base 10 math
import Foundation // includes Decimal
import Darwin // includes pow()

// base 10 columns
123.123

// whole number columns
3 * 1
2 * 10
1 * 100

// decimal fraction columns
1 / pow(10, 1)
2 / pow(10, 2)
3 / pow(10, 3)

// 2. A full solution for applying this math to a button press
var leftHandOperand: Decimal = 0
var isEnteringDecimal: Bool = false
var currentDecimalPlace: Int = 0
func numberPressed(_ number: Decimal) -> Decimal {
    if isEnteringDecimal {
        currentDecimalPlace = currentDecimalPlace + 1
        let newFraction = number / pow(10, currentDecimalPlace)
        leftHandOperand = leftHandOperand + newFraction
    } else {
        leftHandOperand = (leftHandOperand * 10) + number
    }
    return leftHandOperand
}
func decimalPressed() {
    isEnteringDecimal = true
}

numberPressed(1)
numberPressed(2)
numberPressed(3)
decimalPressed()
numberPressed(1)
numberPressed(2)
numberPressed(3)
