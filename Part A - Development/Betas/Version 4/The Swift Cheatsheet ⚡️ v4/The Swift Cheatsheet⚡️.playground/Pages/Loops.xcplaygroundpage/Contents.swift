//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) The Swift Cheatsheet ⚡️
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [The 3 Days of Swift](https://www.3DaysOfSwift.com/3days) | [Interview Prep](https://www.3daysofswift.com/book)
//:
//: -------------------
//:
//: ## Loops
//:
//:
//: Loops repeat branches of code.
//:
//: You use `for`-`in` to iterate over items.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


for i in 0...100 {
    print(i)
}


//:
//: -------------------
//:
//: ## Loops & Collection Types
//:
//: Loops are wonderful to iterate over a collection.
//:
//: The `for`-`in` loop can iterate over each item in an `Array`, `Dictionary` or `Set`.
//:
//: -------------------
//:


let examScores = [50, 77, 90, 45]
var totalScore = 0
for score in examScores {
    totalScore += score
}
let scoreRequiredToGraduate = 200
if totalScore > scoreRequiredToGraduate {
    print("Graduated! 🧑🏽‍🎓 👩🏽‍🎓 👩🏼‍🎓 🎉")
}


//:
//: -------------------
//:
//: ## Iterating Over Collections Within Collections
//:
//: Loops can be useful to iterate through more complicated data sets that may also contain collections.
//:
//: -------------------
//:


let interestingNumbers = [
    "Prime": 
        [2, 3, 5, 7, 11, 13],
    "Fibonacci": 
        [1, 1, 2, 3, 5, 8],
    "Square": 
        [1, 4, 9, 16, 25],
]
var largestNumber = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largestNumber {
            largestNumber = number
        }
    }
}
print(largestNumber)


//:
//: -------------------
//:
//: ## While Loop
//:
//: Use `while` to repeat a block of code until a condition changes.
//:
//: The condition of a loop can be at the end instead, ensuring that the loop is run at least once.
//:
//: -------------------
//:


var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)


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
//: [Website](https://www.3DaysOfSwift.com) | [The 3 Days Of Swift](https://www.3DaysOfSwift.com/3days) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
