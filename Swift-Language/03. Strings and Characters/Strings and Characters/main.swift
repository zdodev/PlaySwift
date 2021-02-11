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

/// Unicode

/// Unicode Scalar Values

/// Extended Grapheme Clusters

let eAcute: Character = "\u{E9}"
print("eAcute: \(eAcute)")
let combinedEAcute: Character = "\u{65}\u{301}"
print("combinedEAcute: \(combinedEAcute)")

let precomposed: Character = "\u{D55C}"
print("precomposed = \(precomposed)")
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
print("decomposed = \(decomposed)")
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
print("enclosedEAcute = \(enclosedEAcute)")
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print("reginalIndicatorForUS = \(regionalIndicatorForUS)")
print("\u{1f1f0}\u{1f1f7}")

/// Counting Characters

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

/// Accessing and Modifying a String

let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])
print(greeting[greeting.index(before: greeting.endIndex)])
print(greeting[greeting.index(after: greeting.startIndex)])
var index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])

//greeting[greeting.endIndex]
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
print("")

/// Inserting and Removing

var hello = "hello"
hello.insert("!", at: hello.endIndex)
print("hello = \(hello)")

hello.insert(contentsOf: " there", at: hello.index(before: hello.endIndex))
print("hello = \(hello)")

hello.remove(at: hello.index(before: hello.endIndex))
print("hello = \(hello)")

let range = hello.index(hello.endIndex, offsetBy: -6)..<hello.endIndex
hello.removeSubrange(range)
print("hello = \(hello)")

/// Substrings

let helloworld = "Hello, world!"
index = helloworld.firstIndex(of: ",") ?? helloworld.endIndex
let beginning = helloworld[..<index]
print("beginning = \(beginning)")
let newString = String(beginning)
print("newString = \(newString)")

/// Comparing Strings

/// String and Character Equality

let quotationString = "We're a lot alike, you and I."
let sameString = "We're a lot alike, you and I."
if quotationString == sameString {
    print("These two strings are considered equal.")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal.")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("There two characters are not equivalent.")
}

/// Prefix and Suffix Equality

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        print(scene)
    }
}
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        print(scene)
    }
}

/// Unicode Representations of Strings

let string = "Dog‼🐶"

/// UTF-8 Representation
for codeUnit in string.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

/// UTF-16 Representation
for codeUnit in string.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

/// Unicode Scalar Representation
for scalar in string.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}

for scalar in string.unicodeScalars {
    print("\(scalar)")
}
