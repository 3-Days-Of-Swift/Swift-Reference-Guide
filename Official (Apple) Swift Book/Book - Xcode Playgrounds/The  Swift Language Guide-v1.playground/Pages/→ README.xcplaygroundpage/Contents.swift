//: ![3 Days Of Swift.com](3DaysOfSwiftLogo-header.png) 🧑🏼‍💻👨🏽‍💻👩🏿‍💻
//:
//: [3DaysOfSwift.com](https://www.www.3DaysOfSwift.com) | [Online Swift Course](https://www.www.3DaysOfSwift.com) | [How Do I Learn Swift?](https://www.3daysofswift.com/how-do-i-learn-swift)
//:
//: ![www.3DaysOfSwift.com](ss-in-content-logo.png)  [Swift.org](https://www.swift.org) | [Official Online Swift Book](https://www.swift.org/documentation/tspl/#the-swift-programming-language-book) | [Online Language Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
//:
/*:
 */
//: -------------------
//: ## The Swift Programming Language Book
//: This is the official Apple Swift Language Guide taken from The Swift Programming Language Book and converted into one Swift playground.
//:
//: v1 | Swift v5.9+ | Xcode 14+ | [The Original Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
//:
//: -------------------
//:
//: ![Swift book cover](Apple-Book-Cover.png)
//:
//: [Online Book](https://www.swift.org/documentation/tspl/#the-swift-programming-language-book) | [iBooks](https://books.apple.com/gb/book/the-swift-programming-language-swift-5-7/id881256329)
//:
//: Welcome to [3 Days Of Swift .com](https://www.www.3DaysOfSwift.com).
//:
//: We converted the official Swift book from Apple into an Xcode playground transforming each published topic into editable and executable code examples.
//:
//: -------------------
//: ## Language Guide Contents
//:
//: * *Topic 1:*   [The Basics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
//: * *Topic 2:*   [Basic Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators)
//: * *Topic 3:*   [Strings and Characters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters)
//: * *Topic 4:*   [Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes)
//: * *Topic 5:*   [Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)
//: * *Topic 6:*   [Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions)
//: * *Topic 7:*   [Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures)
//: * *Topic 8:*   [Enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations)
//: * *Topic 9:*   [Structures and Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)
//: * *Topic 10:*  [Properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties)
//: * *Topic 11:*  [Methods](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/methods)
//: * *Topic 12:*  [Subscripts](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts)
//: * *Topic 13:*  [Inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance)
//: * *Topic 14:*  [Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization)
//: * *Topic 15:*  [Deinitialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/deinitialization)
//: * *Topic 16:*  [Optional Chaining](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/optionalchaining)
//: * *Topic 17:*  [Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling)
//: * *Topic 18:*  [Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency)
//: * *Topic 19:*  [Type Casting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting)
//: * *Topic 20:*  [Nested Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/nestedtypes)
//: * *Topic 21:*  [Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)
//: * *Topic 22:*  [Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols)
//: * *Topic 23:*  [Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics)
//: * *Topic 24:*  [Opaque Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/opaquetypes)
//: * *Topic 25:*  [Automatic Reference Counting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting)
//: * *Topic 26:*  [Memory Safety](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/memorysafety)
//: * *Topic 27:*  [Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol)
//: * *Topic 28:*  [Advanced Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators)
//:
//: -------------------
//:
//: ## Executable Code Examples
//:
//: To execute each code example, hover over the line number and press the run button that appears.
//:
//: 👉 Try it with the code below.


let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
func login() {
    guard currentLoginAttempt < maximumNumberOfLoginAttempts else {
        return
    }
    currentLoginAttempt += 1
    print("logging in..")
}
login()


//:
//: -------------------
//:
//: ![3 Days Of Swift.com](3DaysOfSwiftLogo-footer.png) 👨🏽‍💻 🙋🏼 👩🏿‍💻
//:
//: *..upgrade your life by learning Swift in one weekend!*
//:
//: Why not take our [online course](https://www.3DaysOfSwift.com)?
//:
//: -------------------
//:
//: [Begin  ▶](@next)
//:
//: -------------------
//:
//: 🌎 [3DaysOfSwift.com](https://www.3DaysOfSwift.com) | [Email Us](mailto:helloworld@3daysofswift.com?subject=Hello)
//:
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) students!
