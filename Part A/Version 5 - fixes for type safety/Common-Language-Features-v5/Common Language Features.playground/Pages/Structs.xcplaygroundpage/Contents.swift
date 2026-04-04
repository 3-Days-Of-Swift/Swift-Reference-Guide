//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [The 3 Days of Swift](https://www.3DaysOfSwift.com/3days)
//:
//: -------------------
//:
//: ## Structs
//:
//: Structs define data structures for values.
//:
//: Each structure may have properties and functions.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


struct Example {
    
    // stored properties on the instance
    var storedProperty1: Int
    var storedProperty2: Double
    var storedProperty3: Bool
    var storedProperty4: String
    
    // type properties on the type
    static let typeProperty1:  Int = 1
    static let typeProperty2: Double = 2.0
    static let typeProperty3: Bool = true
    static let typeProperty4: String = "4.0"
    
    // default initialiser
    init() {
        self.storedProperty1 = 1
        self.storedProperty2 = 2.0
        self.storedProperty3 = true
        self.storedProperty4 = "4.0"
    }
    
    // memberwise initialiser
    init(storedProperty1: Int, storedProperty2: Double, storedProperty3: Bool, storedProperty4: String) {
        self.storedProperty1 = storedProperty1
        self.storedProperty2 = storedProperty2
        self.storedProperty3 = storedProperty3
        self.storedProperty4 = storedProperty4
    }
    
    // instance method
    func printDescription() {
        let description = """
        \(storedProperty1)
        \(storedProperty2)
        \(storedProperty3)
        \(storedProperty4)
        """
        print(description)
    }
    
    // type method
    static func printTypeProperties() {
        let description = """
        \(typeProperty1)
        \(typeProperty2)
        \(typeProperty3)
        \(typeProperty4)
        """
        print(description)
    }
}

var example = Example(storedProperty1: 1, storedProperty2: 2, storedProperty3: false, storedProperty4: "four")

// print a stored property from the instance
print(example.storedProperty1)

// print a type property from the type
print(Example.typeProperty1)


//:
//: -------------------
//:
//: ## Structs are Copied in Memory
//:
//: Structures are always copied when they’re passed around in your code.
//:
//: This means we need to know which variable contains which instance and act accordingly.
//:
//: -------------------
//:


struct Person {
    var firstName: String
    var lastName: String
    var nickName: String?
}

var person1 = Person(firstName: "Matt", lastName: "Fleming", nickName: "Matty")
var person2 = person1 // copied!
person2.nickName = nil

// person 2 is a copy
print(person1.nickName ?? "No Nickname")
print(person2.nickName ?? "No Nickname")


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
//: [Website](https://www.3DaysOfSwift.com) | [The 3 Days Of Swift](https://www.3DaysOfSwift.com/3days)
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
