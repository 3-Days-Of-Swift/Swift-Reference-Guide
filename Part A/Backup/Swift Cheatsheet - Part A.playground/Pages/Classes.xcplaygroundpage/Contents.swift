//: ## ![The Swift Logo](swiftLogo43.png) Classes
//:
//: Classes are blueprints that can be used to create objects.
//:
//: Objects are useful to manage data or a specific feature and have a life cycle stored in RAM until all references are disconnected.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


class Blueprint {
    
    init() {
        print("initialise func called")
    }
    
    func someFunction() {
        
    }
    
    deinit {
        print("deinitialise func called")
    }
}

var object1: Blueprint? = Blueprint() // initialised
var reference2: Blueprint? = object1
var reference3: Blueprint? = object1
var reference4: Blueprint? = object1

reference4 = nil
reference3 = nil
reference2 = nil
object1 = nil // deinitialised when last reference is disconnected


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


var object2: Blueprint? = Blueprint() // instantiated a new instance
var object3: Blueprint? = Blueprint() // instantiated a new instance
var object4: Blueprint? = Blueprint() // instantiated a new instance


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
//: 3. Deinitialise object and free allocated memory. 🪦
//:
//: -------------------
//:


class LifeCycle {
    init() {
        print("* initialise *")
    }
    
    func someFunction() {
        
    }
    
    deinit {
        print("* deinitialise *")
    }
}

var lifeCycleDemo: LifeCycle? = LifeCycle()  // Initialise object
lifeCycleDemo?.someFunction()                // Do stuff
lifeCycleDemo = nil                          // Deinitialise object 🪦


//:
//: -------------------
//:
//: ## Init Function
//:
//: The `init` function initialises the object making it ready for use.
//:
//: This not only triggers the begining of its lifespan but allows us to configure the object with custom values.
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
//: ## Classes Are Reference Types
//:
//: Unlike value types, reference types are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used.
//:
//: Here’s an example, using the VideoMode class defined above:
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

//: This example declares a new constant called tenEighty and sets it to refer to a new instance of the VideoMode class. The video mode is assigned a copy of the HD resolution of 1920 by 1080 from before. It’s set to be interlaced, its name is set to "1080i", and its frame rate is set to 25.0 frames per second.
//:
//: Next, tenEighty is assigned to a new constant, called alsoTenEighty, and the frame rate of alsoTenEighty is modified:
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

//: Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance. Effectively, they’re just two different names for the same single instance, as shown in the figure below:
//:
//: ![Diagram](sharedStateClass_2x.png)
//: Checking the frameRate property of tenEighty shows that it correctly reports the new frame rate of 30.0 from the underlying VideoMode instance:
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

//: This example also shows how reference types can be harder to reason about. If tenEighty and alsoTenEighty were far apart in your program’s code, it could be difficult to find all the ways that the video mode is changed. Wherever you use tenEighty, you also have to think about the code that uses alsoTenEighty, and vice versa. In contrast, value types are easier to reason about because all of the code that interacts with the same value is close together in your source files.
//:
//: Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves don’t actually change. tenEighty and alsoTenEighty themselves don’t “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes. It’s the frameRate property of the underlying VideoMode that’s changed, not the values of the constant references to that VideoMode.
//:
//: -------------------
//:
//: ### Identity Operators
//:
//: Because classes are reference types, it’s possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same isn’t true for structures and enumerations, because they’re always copied when they’re assigned to a constant or variable, or passed to a function.)
//:
//: It can sometimes be useful to find out whether two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:
//:
//: * Identical to (===)
//:
//: * Not identical to (!==)
//:
//: Use these operators to check whether two constants or variables refer to the same single instance:
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."

//: Note that identical to (represented by three equals signs, or ===) doesn’t mean the same thing as equal to (represented by two equals signs, or ==). Identical to means that two constants or variables of class type refer to exactly the same class instance. Equal to means that two instances are considered equal or equivalent in value, for some appropriate meaning of equal, as defined by the type’s designer.
//:
//: When you define your own custom structures and classes, it’s your responsibility to decide what qualifies as two instances being equal. The process of defining your own implementations of the == and != operators is described in Equivalence Operators.
//:
//: -------------------
//:
//: ### Pointers
//:
//: If you have experience with C, C++, or Objective-C, you may know that these languages use pointers to refer to addresses in memory. A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, but isn’t a direct pointer to an address in memory, and doesn’t require you to write an asterisk (*) to indicate that you are creating a reference. Instead, these references are defined like any other constant or variable in Swift. The standard library provides pointer and buffer types that you can use if you need to interact with pointers directly—see Manual Memory Management.
//:



















//:
//: -------------------
//: 
//: [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [Email Us](mailto:helloworld@3daysofswift.com?subject=Hello)
//:
//: Ready to start learning Swift? [Yes ✅](https://www.3DaysOfSwift.com)
//:
/*:
 */
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Coding Task  ▶](@next)
//:
//: -------------------
//:
//: ## ![3 Days Of Swift Logo](3DaysIcon146.png) 3 Days Of Swift 
//:
//: © Copyright. All rights reserved.
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) students!
