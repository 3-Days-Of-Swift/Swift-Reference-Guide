//:
//: -------------------
//:
//: ## Some Fun 😁
//: A function can take another function as one of its arguments.
//:
//: -------------------
//:


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}


//:
//: -------------------
//:
//: To execute the function above we must passed in a function that accepts an `Int` and returns a `Bool`.
//:
//: -------------------
//:


func lessThanTen(number: Int) -> Bool {
    number < 10
}

var numbers = [20, 19, 7, 12]

if hasAnyMatches(list: numbers, condition: lessThanTen) {
    print("We have matches!")
}





