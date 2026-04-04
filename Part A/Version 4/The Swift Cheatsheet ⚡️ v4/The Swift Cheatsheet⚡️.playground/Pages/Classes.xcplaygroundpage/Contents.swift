//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) The Swift Cheatsheet ⚡️
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [The 3 Days of Swift](https://www.3DaysOfSwift.com/3days) | [Interview Prep](https://www.3daysofswift.com/book)
//:
//: -------------------
//:
//: ## Classes
//:
//: Classes are treated differently in memory than structures.
//:
//: Each instance of a class is an oject held in memory.
//:
//: This instance is not duplicated when passed around in your code.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


class Blueprint {
     
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
        print("initialising new object")
        self.storedProperty1 = 1
        self.storedProperty2 = 2.0
        self.storedProperty3 = true
        self.storedProperty4 = "4.0"
        print("initialised")
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
    
    // deinitialiser - about to be removed from RAM
    deinit {
        print("about to be destroyed")
    }
}

// how the memory management works
var object1: Blueprint? = Blueprint() // initialised
var reference2: Blueprint? = object1 // reference counter = 2
var reference3: Blueprint? = object1 // reference counter = 3
var reference4: Blueprint? = object1 // reference counter = 4

reference4 = nil // reference counter = 3
reference3 = nil // reference counter = 2
reference2 = nil // reference counter = 1
object1 = nil    // reference counter = 0 - deinitialised called


//:
//: -------------------
//:
//: ## Instantiating A Class
//:
//: When a class is initialised it creates a new and unique instance of it - *💡 known as an object due to its behaviour in memory*.
//:
//: This is known as "instantiating a class".
//:
//: -------------------
//:


var object2: Blueprint? = Blueprint() // instantiated a new instance - a new object
var object3: Blueprint? = Blueprint() // instantiated a new instance - a new object
var object4: Blueprint? = Blueprint() // instantiated a new instance - a new object


//:
//: -------------------
//:
//: ## Object Lifecycle
//:
//: Each object has a life cycle.
//:
//: 1. Allocate memory and initialise object.
//:
//: 2. Do stuff.
//:
//: 3. Deinitialise object and remove from memory (which frees up space). 🪦
//:
//: -------------------
//:


class LifeCycle {
    init() {
        print("* initialise *")
    }
    
    func doStuff() {
        
    }
    
    deinit {
        print("* deinitialise *")
    }
}

var lifeCycleDemo: LifeCycle? = LifeCycle()  // Initialise object
lifeCycleDemo?.doStuff()                     // Do stuff
lifeCycleDemo = nil                          // Deinitialise object 🪦


//:
//: -------------------
//:
//: ## Init Function
//:
//: All stored properties must be initialised by the time the init function returns.
//:
//: This function creates a new object in memory.
//:
//: -------------------
//:


class Robot {
    let name: String
    let model: String
    let batteryCharge: Double
    init(name: String, model: String, batteryCharge: Double) {
        self.name = name
        self.model = model
        self.batteryCharge = batteryCharge
    }
}

let ironMan = Robot(name: "Iron Man", model: "Mark 2", batteryCharge: 100.0)
let bender = Robot(name: "Bender", model: "One and only baby - version 3056", batteryCharge: 100.0)
let robocop = Robot(name: "Robocop", model: "Mark 4", batteryCharge: 33.0)


//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Coding Task  ▶](@next)
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
