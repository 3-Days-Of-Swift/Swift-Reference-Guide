// 1. How to check for numerical math errors
import Foundation

// Type: Integer
//let integer = 100 / 0 // compilation error
print("About to execute Int math")
let intHundered: Int = 100
let intZero: Int = 0
//let intMathError: Int = intHundered / intZero // runtime error

// Type: Double
print("About to execute Double math")
let double: Double = Double(100) / Double(0) // no compilation error
let doubleHundered: Double = 100
let doubleZero: Double = 0
let doubleMathError: Double = doubleHundered / doubleZero
if doubleMathError.isNaN {
    print("Double divided by zero produced a NaN")
}
if doubleMathError.isInfinite {
    print("Double divided by zero produced an infinite value")
}

// Type: Decimal
print("About to execute Decimal math")
let decimal: Decimal = Decimal(100) / Decimal(0) // no compilation error
let decimalHundered: Decimal = 100
let decimalZero: Decimal = 0
let decimalMathError: Decimal = decimalHundered / decimalZero
if decimalMathError.isNaN {
    print("Decimal divided by zero produced a NaN")
}
if decimalMathError.isInfinite {
    print("Decimal divided by zero produced an infinite value")
}
