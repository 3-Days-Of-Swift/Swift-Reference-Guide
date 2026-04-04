//: ## ![The Swift Logo](3DaysIcon146.png)  Strings
//:
//: Strings allow us to represent text in Swift.
//:
//: A `String` is a string of characters representing some text.
//:
//: -------------------
//:
//: [◀  Previous Page](@previous)  |  [Next Page  ▶](@next)
//:
//: -------------------
//:


let aStringOfCharacters: String = "characters."


//:
//: -------------------
//:
//: ## String Literals
//:
//: You can include predefined `String` values within your source code as string literals.
//:
//: A string literal is a sequence of characters surrounded by double quotation marks (`"`).
//:
//: -------------------
//:


let someStringVariable: String = "A string literal hard-coded into the source code"


//:
//: -------------------
//:
//: ## String Interpolation
//:
//: Use a backslash and brackets (`\()`) to embed values in a string literal.
//:
//: This is called "String interpolation".
//:
//: -------------------
//:


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


//:
//: -------------------
//:
//: ## Multiline String Literals
//:
//: Use three double quotation marks (`"""`) for strings that take up multiple lines.
//:
//: -------------------
//:


let hello = "Hello, world!"
let multilineString = """
                  @@@
      @@          @@@@
    @@  @@@         @@@@@
    @@@@@@@@@       @@@@@
      @@@@@@@@@@    @@@@@@
        @@@@@@@@@@  @@@@@@
          @@@@@@@@@@@@@@@@@
@           @@@@@@@@@@@@@@@
@@@@@@        @@@@@@@@@@@@@
  @@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@@@@@@@
        @@@@@@@@@@@@@     @
"""

let sameString1 = "These are the same string."
let sameString2 = """
These are the same string.
"""


//:
//: -------------------
//:
//: ## Multiline String Literal Line Breaks
//:
//: Your line breaks also appear in the string’s value.
//:
//: If you don’t want line breaks to appear inside the string’s value, write a backslash (`\`) at the end of those lines.
//:
//: -------------------
//:


let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

let moreLineBreaks = """

The White Rabbit put on his spectacles.
"Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely,
"and go on till you come to the end; then stop."

"""

let escapingLineBreaks = """

The White Rabbit put on his spectacles.\
"Where shall I begin,\
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely,\
"and go on till you come to the end; then stop."

"""


//:
//: -------------------
//:
//: ## Indentation
//:
//: Indent content from the closing quotations to indicate level of indentation.
//:
//: -------------------
//:


let indentUsingClosingQuote = """

    The White Rabbit put on his spectacles.
    "Where shall I begin,
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely,
    "and go on till you come to the end; then stop."

"""

let twiceIndented = """

        The White Rabbit put on his spectacles.
        "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely,
        "and go on till you come to the end; then stop."

"""


//:
//: -------------------
//:
//: ## Special Characters in String Literals
//:
//: Special characters:
//:
//: * `\0` (null character)
//: * `\\` (backslash)
//: * `\t` (horizontal tab)
//: * `\n` (line feed)
//: * `\r` (carriage return)
//: * `\"` (double quotation mark)
//: * `\'` (single quotation mark)
//:
//: * `\u{24}` (A Unicode scalar value, where 24 is a 1–8 digit hexadecimal number representing the dollar sign `$`)
//:
//: -------------------
//:


let dollarSign = "\u{24}"        // $
let sparklingHeart = "\u{1F496}" // 💖
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"


//:
//: -------------------
//:
//: ## Escaping Special Characters in a Multiline String
//:
//: To include the text `"""` in a multiline string, escape at least one of the quotation marks. For example:
//:
//: -------------------
//:


let threeDoubleQuotationMarks = """
"No need to escape double quotation marks"
""No need to escape two double quotation marks""
\"""Escape three double quotation marks\"""
\"\"\"Or each individually\"\"\"
"""
print(threeDoubleQuotationMarks)


//:
//: -------------------
//:
//: ## Extended String Delimiters
//:
//: You can place a string literal within extended delimiters to include special characters in a string without invoking their effect.
//:
//: -------------------
//:


let escapedLineBreaks = #"Line 1\nLine 2"#

let threeMoreDoubleQuotationMarks = #"""
Line 1\nLine 2
"""Three double quotes"""
\Backslash
"""#

// using string interpolation
print(#"6 times 7 is \#(6 * 7)."#)

//:
//: -------------------
//:
//: ## Concatenating Strings
//:
//: `String` values can be added together (or concatenated) with the addition operator (`+`) to create a new `String` value:
//:
//: -------------------
//:


var welcome = "hello" + " there"
var instruction = "look over"
instruction += " there"


//:
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
