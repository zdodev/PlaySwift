// MARK: Strings and Characters

// MARK: - String Literals

// 단일 문자열은 ""로 표현한다.
let someString = "Some string literal value"

// MARK: Multiline String Literals

// 다중 문자열은 """로 표현한다.
// 항상 다음줄에서 시작해야 한다.
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on till you come to the end; then stop."
"""

// 다중 문자열을 한 줄로 표현할 경우 단일 문자열과 동일합니다.
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

// 한 줄로 표현하고 싶을 땐 '\'을 사용하여 한 줄로 표현할 수 있습니다.
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

// 줄바꿈을 삽입하면 그대로 문자열에 반영됩니다.
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

// 마지막 닫는 따옴표의 들여쓰기만큼 문자열 시작 위치가 변합니다. 따옴표 들여쓰기보다 앞에 있으면 무시하며 따옴표 들여쓰기보다 뒤에 있으면 공백을 삽입합니다.
let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    This line doesn't begin with whitespace.
    """

// MARK: Special Characters in String Literals

// 특수문자
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation mark \"\"\"
"""

// MARK: Extended String Delimiters

// '#'을 사용하여 특수기호를 포함한 문자 그대로의 문자열을 표현할 수 있습니다.
let extendedDelimiter1 = #"Line 1\nLine 2"#

// '\' 문자에 '#'을 삽입하면 특수문자를 사용할 수 있습니다.
let extendedDelimiter2 = #"Line 1\#nLine 2"#
let extendedDelimiter3 = ###"Line 1\###nLine 2"###

// '"""' 에도 사용할 수 있습니다.
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// MARK: - Initializing an Empty String

// MARK: - String Mutability

// MARK: - Strings are Value Types

// MARK: - Working with Characters

// MARK: - Concatenating Strings and Characters

// MARK: - String Interpolation

// MARK: - Unicode

// MARK: Unicode Scalar Values

// MARK: Extended Grapheme Clusters

// MARK: - Counting Characters

// MARK: Accessing and Modifying a String

// MARK: String Indices

// MARK: Inserting and Removing

// MARK: - Substrings

// MARK: - Comparing Strings

// MARK: String and Character Equality

// MARK: Prefix and Suffix Equality

// MARK: - Unicode Representations of Strings

// MARK: UTF-8 Representation

// MARK: UTF-16 Representation

// MARK: Unicode Scalar Representation


