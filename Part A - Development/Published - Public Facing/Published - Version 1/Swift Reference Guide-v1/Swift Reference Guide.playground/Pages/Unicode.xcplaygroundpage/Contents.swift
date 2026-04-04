//: ## ![3DaysOfSwift.com Logo](3DaysOfSwift-Icon-80.png) Swift.
//: ©️ copyright of [3DaysOfSwift.com](https://www.3DaysOfSwift.com)
//:
//: -------------------
//:
//: ## Unicode
//:
//: Unicode is the international standard for writing characters in computer systems.
//:
//: Each character is represented by a hexidecimal value. Conventionally written as `U+` followed by four, five, or six hexadecimal digits. i.e. `U+0061` for `a`.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


let smallA: String = "\u{0061}" // U+0061 = a
let chickEmoji: String = "\u{1F425}" // U+1F425 = 🐥


//:
//: -------------------
//:
//: ## Unicode Scalar Values
//:
//: Behind the scenes, `String` is built from Unicode scalar values.
//:
//: We can use the escape character to embed unicode characters for `String` and `Character`.
//:
//: -------------------
//:


let latinSmallLetterA: Character = "\u{0061}" // a
let frontFacingBabyChick: Character = "\u{1F425}" // 🐥
let koreanAlphabetSyllables: Character = "\u{D55C}" // 한


//:
//: -------------------
//:
//: ## Unicode Encoding
//:
//: When a `String` is written to a text file, the Unicode scalars in that string are encoded in one of several formats:
//:
//: ### UTF-8
//:
//: 8-bits (1 byte) is used to represent each code unit. Each code unit can be between `0` and `255`.
//:
//: -------------------
//:


// 8-bit byte (0 - 255) code unit in array of UInt8 values
for codeUnit in "Dog‼🐶".utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "


//:
//: -------------------
//:
//: ### UTF-16
//:
//: 16-bits (2 bytes) are used to represent each code unit. Each code unit can be between `0` and `65,535`.
//:
//: -------------------
//:


for codeUnit in "Dog‼🐶".utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "


//:
//: -------------------
//:
//: ### UTF-32
//:
//: 32-bits (4 bytes) are used to represent each code unit. Each code unit can be between `0` and `4,294,967,295`.
//:
//: -------------------
//:


for scalar in "Dog‼🐶".unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "


//:
//: -------------------
//:
//: ### UTF-8 Encoding Explained
//:
//: In the example below; The first three 8-bit bytes (68, 111, 103) represent the characters `D`, `o`, and `g`.
//:
//: The next three-bytes (226, 128, 188) represent the `DOUBLE EXCLAMATION MARK` character.
//:
//: The last four-bytes (240, 159, 144, 182) represent the `DOG FACE` character.
//:
//: ![Diagram](UTF8_2x.png)
//:
//: -------------------
//:


// 8-bit byte (0 - 255) code unit in array of UInt8 values
for codeUnit in "Dog‼🐶".utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "


//:
//: -------------------
//:
//: ### UTF-16 Encoding Explained
//:
//: In the example below; The first three 16-bit values (68, 111, 103) represent the characters `D`, `o`, and `g`.
//:
//: The fourth `codeUnit` value (8252) is a decimal equivalent of the hexadecimal value 203C, which represents the Unicode scalar `U+203C` for the `DOUBLE EXCLAMATION MARK` character. This character can now be represented as a single code unit in UTF-16.
//:
//: The fifth and sixth `codeUnit` values (55357 and 56374) are a UTF-16 decimal value for the `DOG FACE` character. When converted to hexadecimal they reveal their unicode values. Hexadecimal value of 55357 is D83D (Unicode U+D83D) and a hexadecimal value of 56374 is DC36 (Unicode U+DC36).
//:
//: ![Diagram](UTF16_2x.png)
//:
//: -------------------
//:


for codeUnit in "Dog‼🐶".utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "


//:
//: -------------------
//:
//: ### UTF-32 Encoding Explained
//:
//: In the example below; The first three 16-bit values (68, 111, 103) represent the characters `D`, `o`, and `g`.
//:
//: The fourth `codeUnit` (`8252`) is a decimal equivalent of the hexadecimal value `203C`, which represents the `DOUBLE EXCLAMATION MARK` character (`U+203C`).
//:
//: The final `codeUnit` or `UnicodeScalar` is `128054`, and is the decimal equivalent of the hexadecimal value `1F436`, which represents the `DOG FACE` character (`U+1F436`).
//:
//: ![Diagram](UnicodeScalar_2x.png)
//:
//: -------------------
//:


for scalar in "Dog‼🐶".unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "


//:
//: -------------------
//:
//: ## 32 Bit UnicodeScalars Property
//:
//: The 32 bit (UTF-32) encoding allows us to represent each value by one code unit using the `UInt32` type (unsigned integer using 32 bits).
//:
//: This means that we can use one value to represent both the code unit and the character it represents.
//:
//: -------------------
//:


print("Value: ")
for scalar in "Dog‼🐶".unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
// "68 111 103 8252 128054 "

print("Scalar: ")
for scalar in "Dog‼🐶".unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶


//:
//: -------------------
//:
//: ## Extended Grapheme Clusters
//:
//: A grapheme cluster is used, for instance, when there's no available single Unicode character that already exists.
//:
//: The letter `é` can be represented as a single Unicode scalar `é`.
//:
//: However, the same letter can also be represented as a pair of scalars combined together. i.e. `e` and `´`.
//:
//: -------------------
//:


// cluster of single scalars
let e: Character = "\u{65}" // e
let acuteAccent: Character = "\u{301}" // ´
let eAcuteAccent: Character = "\u{E9}" // é

// cluster of two scalars. e + ´ = é
let combinedEAcute: Character = "\u{65}\u{301}" // é
let enclosedEAcute: Character = "\u{E9}\u{20DD}" // é⃝


var word: String = "cafe"
word += "\u{301}" // combining acute accent ´
// still 4 characters though!
print("the number of characters in \(word) is \(word.count)")


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
//: [Website](https://www.3DaysOfSwift.com)
//:
//: Welcome to our community of [3DaysOfSwift.com](https://www.3DaysOfSwift.com) developers!
//:
//: 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
//:
