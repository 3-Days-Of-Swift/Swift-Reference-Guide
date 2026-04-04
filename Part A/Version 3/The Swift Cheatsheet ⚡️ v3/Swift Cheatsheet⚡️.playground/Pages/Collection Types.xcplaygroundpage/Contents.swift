//: ## ![3DaysOfSwift.com Logo](PageHeader.png) ⚡️ The Swift Cheatsheet
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [3 Days of Swift Bootcamp](https://www.3DaysOfSwift.com/bootcamp) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: -------------------
//:
//: ## Collection Types
//:
//:
//: Collection Types store multiple values.
//:
//: Swift provides 3 primary collection types; `Array`, `Dictionary` and `Set`.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:
//: ![Diagram](CollectionTypes_intro_2x.png)
//:
//: -------------------
//:


let anArray: [Int] = [1, 2, 3, 4, 5]
let aDictionary: [String: Int] = ["key1": 1, "key2": 2, "key3": 3, "key4": 4, "key5": 5]
let aSet: Set<Int> = [1, 2, 3, 4, 5]


//:
//: -------------------
//:
//: ## Arrays
//:
//: Arrays are ordered lists.
//:
//: -------------------
//:


var todoList: [String] = ["wash car", "washing up", "tidy room", "Shopping"]
let firstElement = todoList.first
let lastElement = todoList.last


//:
//: -------------------
//:
//: ## Dictionarys
//:
//: Dictionarys store values against a unique keys.
//:
//: Values are not stored in any particular no order.
//:
//: -------------------
//:


let occupations: [String: String] = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
    "James": "Swift Engineer",
 ]

let malcomsOccupation = occupations["Malcolm"]
let kayleesOccupation = occupations["Kaylee"]
let jamesOccupation = occupations["James"]


//:
//: -------------------
//:
//: ## Sets
//:
//: Sets store unique values without any order.
//:
//: -------------------
//:


let countriesIWantToVisit: Set<String> = [
    "UK",
    "USA",
    "Jamaica",
    "Thailand",
    "Mexico"
]
if countriesIWantToVisit.contains("Mexico") {
    print("Set contains Mexico")
}


//:
//: -------------------
//:
//: ## Empty Collections
//:
//: Swift provides an easy short-cut to create an empty collection using square brackets.
//:
//: -------------------
//:


let emptyArray: [String] = []
let emptyDictionary: [String: String] = [:]
let emptySet: Set<String> = []


//:
//: -------------------
//:
//: ## Creating an Array by Adding Two Arrays Together
//:
//: Create an array by adding two arrays together.
//:
//: The type is inferred from the type of the two arrays added together.
//:
//: -------------------
//:


let threeFives: [Int] = [5, 5, 5]
let anotherThreeFives: [Int] = [5, 5, 5]
let sixFives: [Int] = threeFives + anotherThreeFives


//:
//: -------------------
//:
//: ## Creating an Array with an Array Literal
//:
//: An array literal is written as a list of values, separated by commas, surrounded by a pair of square brackets:
//:
//: -------------------
//:


["value1", "value2", "value3"]


//:
//: -------------------
//:
//: ## Accessing and Modifying an Array
//:
//: You access and modify an array through its methods and properties, or by using subscript syntax (square brackets `[]`).
//:
//: -------------------
//:


var shoppingList: [String] = ["cheese", "milk", "water", "bread"]
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

var firstItem = shoppingList[0]
firstItem = shoppingList[0]

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]

shoppingList.insert("Maple Syrup", at: 0)

let mapleSyrup = shoppingList.remove(at: 0)
let apples = shoppingList.removeLast()


//:
//: -------------------
//:
//: ## Iterating Over an Array
//:
//: Iterate over the entire set of values using a `for-in` loop.
//:
//: -------------------
//:


for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas


//:
//: -------------------
//:
//: ## Enumerated Function
//:
//: The `enumerated()` method returns a tuple containg the index and element.
//:
//: -------------------
//:


for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas


//:
//: -------------------
//:
//:
//: ## Hashable Elements in a Set
//:
//: A type must be hashable in order to be stored in a set.
//:
//: A hash value is an `Int` value that’s the same for all objects that compare equally.
//:
//: `if a == b` then the hash value of `a` is equal to the hash value of `b`.
//:
//: -------------------
//:


if threeFives.hashValue == anotherThreeFives.hashValue {
    print("Equal values: identical hash values!")
}


//:
//: -------------------
//:
//: ## Set Type Syntax
//:
//: The type is written `Set<Element>`, where `Element` is the type for each element.
//:
//: Set don’t have a shorthand form.
//:
//: -------------------
//:


let anotherSet: Set<Int> = [1, 2, 3, 4, 5]


//:
//: -------------------
//:
//: ## Creating and Initializing an Empty Set
//:
//: You can create an empty set using initializer syntax.
//:
//: Or using an array literal if the type annotation is specified.
//:
//: -------------------
//:


var letters: Set<Character> = Set<Character>()
var moreletters: Set<Character> = ["a", "b", "c"]


//:
//: -------------------
//:
//: ## Using an Array Literal
//:
//: If the context already provides type information, you can create a set with array literal values or use an empty array literal.
//:
//: -------------------
//:


letters = ["a", "b", "c"]
moreletters = []


//:
//: -------------------
//:
//: ## Accessing and Modifying a Set
//:
//: You access and modify a set through its methods and properties.
//:
//: To find out the number of items in a set, check its read-only `count` property:
//:
//: -------------------
//:


var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

print("I have \(favoriteGenres.count) favorite music genres.")
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}


//:
//: -------------------
//:
//: ## Iterating Over a Set
//:
//: You can iterate over the values in a set with a `for-in` loop.
//:
//: -------------------
//:


for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop


//:
//: -------------------
//:
//: ## How to Sort a Set
//:
//: Swift’s Set type doesn’t have a defined ordering. To iterate over the values of a set in a specific order, use the `sorted()` method, which returns the set’s elements as an array sorted using the `<` operator.
//:
//: -------------------
//:


for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz


//:
//: -------------------
//:
//: ## Performing Set Operations
//:
//: You can efficiently perform fundamental set operations:
//:
//: * such as combining two sets together
//:
//: * determining which values two sets have in common
//:
//: * or determining whether two sets contain all, some, or none of the same values.
//:
//: ![Diagram](setVennDiagram_2x.png)
//:
//: -------------------
//:


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


//:
//: -------------------
//:
//: ## Intersection
//:
//: Use the `intersection(_:)` method to create a new set with only the values common to both sets.
//:
//: -------------------
//:


oddDigits.intersection(evenDigits).sorted()


//:
//: -------------------
//:
//: ## Symmetric Difference
//:
//: Use the `symmetricDifference(_:)` method to create a new set with values in either set, but not both.
//:
//: -------------------
//:


oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()


//:
//: -------------------
//:
//: ## Union
//:
//: Use the `union(_:)` method to create a new set with all of the values in both sets.
//:
//: -------------------
//:


oddDigits.union(evenDigits).sorted()


//:
//: -------------------
//:
//: ## Subtracting
//:
//: Use the `subtracting(_:)` method to create a new set with values not in the specified set.
//:
//: -------------------
//:


oddDigits.subtracting(singleDigitPrimeNumbers).sorted()


//:
//: -------------------
//:
//: ## Set Membership and Equality
//:
//: Use the “is equal” operator (`==`) to determine whether two sets contain a matching set of values.
//:
//: ![Diagram](setEulerDiagram_2x.png)
//:
//: -------------------
//:


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
if houseAnimals == cityAnimals {
    print("Will never execute")
}


//:
//: -------------------
//:
//: ## Is Subset
//:
//: Use the `isSubset(of:)` method to determine whether all of the values of a set are contained in the specified set.
//:
//: -------------------
//:


houseAnimals.isSubset(of: farmAnimals)


//:
//: -------------------
//:
//: ## Is Superset
//:
//: Use the `isSuperset(of:)` method to determine whether a set contains all of the values in a specified set.
//:
//: -------------------
//:


farmAnimals.isSuperset(of: houseAnimals)


//:
//: -------------------
//:
//: ## Is Strict Subset
//:
//: Use the `isStrictSubset(of:)` or `isStrictSuperset(of:)` methods to determine whether a set is a subset or superset, but not equal to, a specified set.
//:
//: -------------------
//:


farmAnimals.isStrictSuperset(of: houseAnimals)


//:
//: -------------------
//:
//: ## Is Disjoint
//:
//: Use the `isDisjoint(with:)` method to determine whether two sets have no values in common.
//:
//: -------------------
//:


farmAnimals.isDisjoint(with: cityAnimals)


//:
//: -------------------
//:
//: ## Dictionary Type Longhand Syntax
//:
//: The dictionary type is written `Dictionary<Key, Value>`.
//:
//:
//: -------------------
//:


var dictionary: Dictionary<String, String> = Dictionary<String, String>()


//:
//: -------------------
//:
//: ## Dictionary Type Shorthand Syntax
//:
//: You can also write the type of a dictionary in shorthand form as `[Key: Value]`. 
//:
//: -------------------
//:


var dictionary2: [String: String] = [:]


//:
//: -------------------
//:
//: ## Creating an Empty Dictionary
//:
//: Create an empty `Dictionary` using shortform or longform initializer syntax.
//:
//: -------------------
//:


dictionary = [:]
dictionary = Dictionary<String, String>()


//:
//: -------------------
//:
//: ## Dictionary Type Inference
//:
//: Because all keys in the literal are of the same type as each other, and likewise all values are of the same type as each other, Swift can infer that `[String: String]` is the correct type to use for the airports dictionary.
//:
//: -------------------
//:


var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


//:
//: -------------------
//:
//: ## Empty Dictionary Literal
//:
//: If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, written `[:]`.
//:
//: -------------------
//:


airports = [:]


//:
//: -------------------
//:
//: ## Creating a Dictionary with a Dictionary Literal
//:
//: A key-value pair combination is required separated by commas, surrounded by a pair of square brackets.
//:
//: -------------------
//:


// [key1: value1, key2: value2, key3: value3]
airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


//:
//: -------------------
//:
//: ## Hashable Dictionary Keys
//:
//: To ensure no duplicates exist in the dictionary, each `Key` must be hashable.
//:
//: -------------------
//:


if "YYZ".hashValue == "DUB".hashValue {
    print("Not Possible: Will never execute")
} else if "YYZ".hashValue == "yyz".hashValue {
    print("Not Possible: Will never execute")
} else if "YYZ".hashValue == "YYZ".hashValue {
    print("The data is identical")
}


//:
//: -------------------
//:
//: ## Accessing and Modifying a Dictionary
//:
//: You access and modify a dictionary through its methods and properties, or by using subscript syntax.
//:
//: -------------------
//:


print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}


//:
//: -------------------
//:
//: ## An Alternative to Subscripting
//:
//: As an alternative to subscripting, you can use the `updateValue(_:forKey:)` method to set or update the value for a key.
//:
//: -------------------
//:


if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}


//:
//: -------------------
//:
//: ## Iterating Over a Dictionary
//:
//: You can iterate over the key-value pairs in a dictionary with a `for-in` loop. 
//:
//: Each item in the dictionary is returned as a `(key, value)` tuple.
//:
//: -------------------
//:


for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson


//:
//: -------------------
//:
//: ## Keys and Values Properties
//:
//: You can also retrieve an iterable collection of a dictionary’s keys or values by accessing its `keys` and `values` properties.
//:
//: -------------------
//:


for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson


//:
//: -------------------
//:
//: ## Convert Keys or Values into an Array
//:
//: If you need to use a dictionary’s keys or values as an `Array`, you can initialize a new array with the `keys` or `values` property:
//:
//: -------------------
//:


let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]


//:
//: -------------------
//:
//:
//: [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [Email Us](mailto:helloworld@3daysofswift.com?subject=Hello)
//:
//: Ready to start learning Swift? [Yes ✅](https://www.3DaysOfSwift.com)
//:
/*:
 */
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:
//: ![3 Days Of Swift Logo](Footer.png) [Website](https://www.3DaysOfSwift.com) | [3 Days Of Swift Bootcamp](https://www.3DaysOfSwift.com/bootcamp) | [Interview Prep](https://www.3DaysOfSwift.com/interview-prep)
//:
//: © Copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com). All rights reserved. Don't forget - come back when you've got an [interview](https://www.3DaysOfSwift.com/interview-prep)!
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
