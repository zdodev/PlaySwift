/// String Literals
/*
 문자열 리터럴을 사용해서 상수에 저장.
 */
let someString = "Some string literal value"
print("someString = \(someString)")

/// Multiline String Literals
/*
 다중라인 문자열 표현
 */

let quotation = """
The While Rabbit put on his spetacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print("quotation = \(quotation)")

let singleLineString = "These are the same."
let multilineString = """
There are the same.
"""
print("singleLineString = \(singleLineString)")
print("multilineString = \(multilineString)")

/*
 다중라인 문자열의 개행을 한 줄로 표현할 때
 */
let softWrappedQuotation = """
The White Rabbit put on his spectacles. "Where shall I begin, \
plese your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print("softWrappedQuotattion = \(softWrappedQuotation)")

/*
 Multi-line string literal content must begin on a new line
 */

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print("lineBreaks = \(lineBreaks)")

let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    This line doesn't begin with whitespace.
"""
print("linesWithIndentation = \(linesWithIndentation)")

/// Special Characters in String Literals

/*
 \0
 \\
 \t
 \n
 \r
 \"
 \'
 \u{n}
 */

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print("wiseWords = \(wiseWords)")
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"
print("\u{0024} = \(dollarSign), \u{2665} = \(blackHeart), \u{1F496} = \(sparklingHeart)")

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print("threeDoubleQuotationMarks = \(threeDoubleQuotationMarks)")

/// Extended String Delimiters
let extendedDelimiter1 = #"Line1 \nLine2"#
print("extendedDelimiter1 = \(extendedDelimiter1)")
let extendedDelimiter2 = #"Line1 \#nLine2"#
print("extendedDelimiter2 = \(extendedDelimiter2)")
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print("threeMoreDoubleQuotationMarks = \(threeMoreDoubleQuotationMarks)")

/// Initializing an Empty String

var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}

/// String Mutability

var variableString = "Horse"
variableString += " and carriage"
print("variableString = \(variableString)")

let constantString = "Highlander"
//constantString += " and another Highlander"

/// Strings are Value Types
/*
 copy-by-default
 */

/// Workikng with Characters

for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"
print(exclamationMark)

let catCharacters: [Character] = ["C", "a", "t", "!", "😸"]
let catString = String(catCharacters)
print("catString = \(catString)")

/// Concatenating Strings and Characters

let string1 = "hello"
let string2 = " three"
var welcome = string1 + string2
print("welcome = \(welcome)")

var instruction = "look over"
instruction += string2
print("instruction = \(instruction)")

let questionMark: Character = "?"
welcome.append(questionMark)
print("welcome = \(welcome)")

let badStart = """
one
two
"""
let end = """
three
"""
print("badStart + end = \(badStart + end)")

let goodStart = """
one
two

"""
print("goodStart + end = \(goodStart + end)")

/// String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print("message = \(message)")

print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"6 times 7 is \#(6 * 7)."#)

