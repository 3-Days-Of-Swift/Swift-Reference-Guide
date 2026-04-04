//: ## ![The Swift Logo](swiftLogo43.png) Structs
//:
//:
//: Structs define new data structures.
//:
//: Each structure may have stored properties and functions.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


struct Example {
    var storedProperty1: Int
    var storedProperty2: Double
    var storedProperty3: Bool
    var storedProperty4: String
    
    func printDescription() {
        let description = """
        \(storedProperty1)
        \(storedProperty2)
        \(storedProperty3)
        \(storedProperty4)
        """
        print(description)
    }
}
let example = Example(storedProperty1: 1, storedProperty2: 2, storedProperty3: false, storedProperty4: "four")


//:
//: -------------------
//:
//: ## Structs are Copied in Memory
//:
//: Structures are always copied when they’re passed around in your code.
//:
//: This means that we need to know which instance we are changing.
//:
//: -------------------
//:


struct Person {
    var firstName: String
    var lastName: String
    var nickName: String?
}

var person1 = Person(firstName: "Matt", lastName: "Fleming", nickName: "Matty")
var person2 = person1
person2.nickName = nil

// person 2 is a copy
print(person1.nickName ?? "No Nickname")
print(person2.nickName ?? "No Nickname")












//: -------------------
//:
//: ## Structures and Enumerations Are Value Types
//:
//: A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function.
//:
//: You’ve actually been using value types extensively throughout the previous chapters. In fact, all of the basic types in Swift—integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types, and are implemented as structures behind the scenes.
//:
//: All structures and enumerations are value types in Swift. This means that any structure and enumeration instances you create—and any value types they have as properties—are always copied when they’re passed around in your code.
//:
//: * callout(Note):
//:     → Collections defined by the standard library like arrays, dictionaries, and strings use an optimization to reduce the performance cost of copying. Instead of making a copy immediately, these collections share the memory where the elements are stored between the original instance and any copies. If one of the copies of the collection is modified, the elements are copied just before the modification. The behavior you see in your code is always as if a copy took place immediately.
//:
//: Consider this example, which uses the Resolution structure from the previous example:
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

//: This example declares a constant called hd and sets it to a Resolution instance initialized with the width and height of full HD video (1920 pixels wide by 1080 pixels high).
//:
//: It then declares a variable called cinema and sets it to the current value of hd. Because Resolution is a structure, a copy of the existing instance is made, and this new copy is assigned to cinema. Even though hd and cinema now have the same width and height, they’re two completely different instances behind the scenes.
//:
//: Next, the width property of cinema is amended to be the width of the slightly wider 2K standard used for digital cinema projection (2048 pixels wide and 1080 pixels high):
cinema.width = 2048

//: Checking the width property of cinema shows that it has indeed changed to be 2048:
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"

//: However, the width property of the original hd instance still has the old value of 1920:
print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"

//: When cinema was given the current value of hd, the values stored in hd were copied into the new cinema instance. The end result was two completely separate instances that contained the same numeric values. However, because they’re separate instances, setting the width of cinema to 2048 doesn’t affect the width stored in hd, as shown in the figure below:
//:
//: ![Diagram](sharedStateStruct_2x.png)
//: The same behavior applies to enumerations:
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")
// Prints "The current direction is north"
// Prints "The remembered direction is west"

//: When rememberedDirection is assigned the value of currentDirection, it’s actually set to a copy of that value. Changing the value of currentDirection thereafter doesn’t affect the copy of the original value that was stored in rememberedDirection.
//:
//: -------------------




//:
//: -------------------
//:
//: ### Memberwise Initializers for Structure Types
//:
//: All structures have an automatically generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name:
let vga = Resolution(width: 640, height: 480)

//: Unlike structures, class instances don’t receive a default memberwise initializer. Initializers are described in more detail in Initialization.
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
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
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
