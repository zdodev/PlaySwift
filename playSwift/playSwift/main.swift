/// The Basics

/// Constants and Variables

// 상수(constant)는 값을 변경할 수 없으며, 변수(variable)은 값을 변경할 수 있습니다.

/// Declaring Constants and Variables

// 상수는 키워드 'let'을 사용하여 선언하며, 변수는 키워드 'var'을 사용하여 선언합니다.

// let - Let Declararion
// Creates a variable that cannot be changed.
let maximumNumberOfLoginAttempts = 10
// var - Var Declaration
// Creates a variable that can be changed.
var currentLoginAttemp = 0

let price = 100
var age = 500

// 콤마(,)를 사용하여 한 줄에 여러 상수, 변수를 선언할 수 있습니다.

var x = 0.0, y = 0.0, z = 0.0

/// Type Annotations

// 상수 또는 변수를 선언할 때 타입을 명시하여 선언할 수 있습니다.

var welcomeMessage: String
welcomeMessage = "Hello"

// 콤마(,)를 사용하여 한 줄에 같은 타입의 변수를 선언할 수 있습니다.

var red, green, blue: Double

/*
 실제로 type annotations를 사용하지 않더라도 Swift의 타입 추론을 통해 변수 선언 시 초기 값을 제공하면
 Swift에서 타입을 추론하여 지정합니다.
 */

/// Naming Constants and Variables

// Swift의 변수는 유니코드 문자를 사용하여 선언할 수 있습니다.

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let 전공 = "컴퓨터공학"

/*
 변수의 이름은 공백, 수학 기호, 화살표, 사용자 정의 유니코드, line- and box-drawing 문자를 사용할 수 없습니다.
 숫자의 경우 변수의 첫 번째 문자로 사용할 수 없지만 두 번째 문자 이후로 사용할 수 있습니다.
 */

/*
 Swift에서 사용하는 예약된 키워드는 변수명으로 사용할 수 없습니다. 하지만 "`" 억음 부호를 사용하면
 예약된 키워드를 변수로 사용할 수는 있습니다.
 */

let `case` = 3

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
// Cannot assign to value: 'languageName' is a 'let' constant
// languageName = "Swift++"

/// Printing Constants and Variables

// print(_:separator:terminator:) 함수를 사용하여 변수의 값을 출력할 수 있습니다.

print(friendlyWelcome)

// string interpolation을 사용하면 문자열 내에 변수의 현재 값을 포함하여 문자열을 생성할 수 있습니다.

print("friendlyWelcome의 값은 \(friendlyWelcome)입니다.")


// Comments

// "//" 문자를 사용하여 주석을 표시합니다.

// 이 문장은 주석입니다.

/*
 이 문장은 주석입니다.
 여러 줄에 걸쳐 주석을 표시할 수 있습니다.
 */

/*
 이 문장은 주석입니다.
 /*
  Swift는 중첩된 주석을 지원합니다.
  */
 */


/// Semicolons

// Swift는 구문 끝에 ';'을 사용하지 않아도 됩니다.
// 한 줄에 여러 구문을 사용할 때는 ';'을 사용하여 구문을 나열합니다.

let cat = "🐱"; print(cat)

/// Integers

/// Integer Bounds

let minValue = UInt8.min
let maxValue = UInt8.max

/// Int

// Int는 정수형(양수, 음수) 숫자를 나타내는 타입입니다.
// Swift에서 Int 타입은 현재 플랫폼의 아키텍처에 따라 그 크기가 결정됩니다.
// 32비트 아키텍처에서는 Int32 크기로 결정됩니다.
// 64비트 아키텍처에서는 Int64 크기로 결정됩니다.
// 특정한 정수 타입으로 동작해야하는 것이 아니면 기본적으로 Int 타입을 사용하는게 좋습니다.

let int8Value: Int8 = Int8.max
let int16Value: Int16 = Int16.max
let int32Value: Int32 = Int32.max
let int64Value: Int64 = Int64.max

/// UInt

// UInt는 정수형(양수) 숫자를 나타내는 타입입니다.
// Swift에서 UInt 타입은 현재 플랫폼의 아키텍처에 따라 그 크기가 결정됩니다.
// 32비트 아키텍처에서는 UInt32 크기로 결정됩니다.
// 64비트 아키텍처에서는 UInt64 크기로 결정됩니다.

let uInt8Value: UInt8 = UInt8.max
let uInt16Value: UInt16 = UInt16.max
let uInt32Value: UInt32 = UInt32.max
let uInt64Value: UInt64 = UInt64.max

/// Floating-Point Numbers

// Floating-Point는 실수형 숫자를 나타내는 타입입니다.

let floatValue: Float = Float.greatestFiniteMagnitude
let float80Value: Float80 = Float80.greatestFiniteMagnitude
let doubleValue: Double = Double.greatestFiniteMagnitude

/*
 Double 타입은 최소 15자리 정밀도를 나타내고 Float 타입은 최소 6자리 정밀도를 나타냅니다.
 */

/// Type Safety and Type Inference

/*
 Swift는 타입 안전 언어입니다. 타입 안전은 코드에서 사용할 수 있는 값의 타입에 대해 명확하게 알려줍니다.
 컴파일 시 타입 검사를 통해 일치하지 않는 타입에 대해 에러를 표시합니다.
 
 Swift는 타입 추론 기능을 지원합니다. 변수 선언 시 할당된 값에 따라 자동으로 타입을 지정해줍니다.
 */

// 다음 구문은 Int 타입으로 추론합니다.
let meaingOfLife = 42

// 다음 구문은 Double 타입으로 추론합니다.
let pi = 3.141592
let pi2 = 3 + 0.141592

// 다음 구문은 String 타입으로 추론합니다.
let language = "Swift"

/// Numeric Literals

/*
 정수 리터럴 상수 표현
 2진수는 접두사 0b를 사용한다.
 8진수는 접두사 0o를 사용한다.
 16진수는 접두사 0x를 사용한다.
 */

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

/*
 실수 리터럴 상수 표현
 16진수는 접두사 0x를 사용한다.
 지수 표현법으로 'e'를 사용할 수 있습니다. 16진수 지수 표현법으로 'p'를 사용할 수 있습니다.
 */

let floatingPointNumber1 = 1.25e2
let floatingPointNumber2 = 1.25e-2

// 16진수의 경우 밑이 2가 됩니다.

let floatingPointNumber3 = 0xFp2
let floatingPointNumber4 = 0xFp-2

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// 숫자 리터럴 상수는 읽기 쉽도록 하기 위해 추가적인 표현법을 가지고 있습니다.
// 숫자 리터럴 상수 앞에 추가적으로 0을 채워 표현할 수 있습니다.
// 숫자 리터럴 상수 내 '_' 문자를 사용하여 표현할 수 있습니다.

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/// Numeric Type Conversion

/// Integer Convension

// 변수에 값을 할당할 때에는 타입이 저장할 수 있는 범위 내의 값을 할당해야 합니다.

// Negative integer '-1' overflow when stored into unsigned type 'UInt8'
// let cannotBeNegative: UInt8 = -1
// Arithmetic operation '127 + 1' (on type 'Int8') results in an overflow
// let tooBig: Int8 = Int8.max + 1

// 같은 정수형이라도 타입이 다른 변수끼리는 연산을 할 수 없습니다.
// 기존의 타입을 다른 타입으로 변환하려면 초기화를 사용하면 됩니다.

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// 'type(기존값)' 형식은 기존값을 새로운 type 형식으로 바꾸는 방법입니다.

/// Integer and Floating-Point Conversion

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi3 = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)

/*
 변수끼리의 연산과 숫자 리터럴 상수끼리의 연산의 규칙은 다릅니다.
 */

/// Type Aliases

// type aliases은 기존의 타입 이름에 또 다른 이름을 생성하는 기능을 합니다.
// 'typealias' 키워드를 사용합니다.
// Language Reference -> Types -> Type Identifier

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min

typealias Point = (Int, Int)

var point = Point(3, 4)

/// Booleans

// A value type whose instances are either true or false.
// @frozen struct Bool
// Swift는 Boolean 타입을 가지고 있습니다.

let orangesAreOrange = true
let turnipsAreDelicious = false

// Boolean 타입은 조건문에서 유용하게 쓰입니다.

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

/// Tuples

// 튜플은 여러 가지의 값을 하나의 그룹으로 표현하는 타입이며, 어떤 타입이던지 상관이 없습니다.

let http200Success: (Int, String) = (200, "Ok")
let http404Error = (404, "Not Found")

// 튜플의 각각의 값을 변수에 각각 담을 수 있습니다.

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// '_' 특수문자를 사용하여 튜플의 원하는 값만을 추출하여 변수에 담을 수 있습니다.

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// '.(index 번호)'와 같이 튜플 내 값에 직접 접근할 수 있습니다.

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")


// 튜플 선언 시 각각의 값에 이름을 지어줄 수 있으며, 지어준 이름으로 튜플 내 값에 직접 접근할 수 있습니다.

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status code is \(http200Status.description)")

/*
 튜플은 함수에서 두 개 이상의 값을 반환할 때 유용할 수 있습니다. 서로 관련된 값에 그룹을 지어 표현하기 좋습니다.
 복잡한 값을 구성할 때에는 구조체나 클래스를 사용하는 것이 더 유용합니다.
 */

/// Optionals

// 옵셔널은 변수에 값이 존재하지 않는 경우를 나타낼 수 있는 타입입니다.
// 따라서 값이 존재하는 경우 언래핑을 통해 옵셔널 내 값을 추출하거나,
// 값이 없는 경우에는 값이 없음을 나타내는 키워드 'nil'로 설정됩니다.

// 문자열을 정수형으로 변환할 수 있습니다. 정수형으로 변환할 수 있는 문자열은 변환 성공 시 옵셔널 리터럴 상수가 반환되고,
// 문자열을 정수형으로 변환할 수 없으면 nil이 반환됩니다.

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

// 반환된 옵셔널 리터럴 상수의 타입은 'Int?' 타입입니다. 타입 뒤에 삽입된 특수문자 '?'는 옵셔널을 나타내는 표현입니다.

/// nil

// 'nil'은 값이 존재하지 않는다는 표현의 키워드입니다.

var serverResponseCode: Int? = 404
serverResponseCode = nil

/*
 일반 변수에는 nil을 할당할 수 없습니다. nil은 오직 옵셔널 타입에만 할당할 수 있습니다.
 */

// 옵셔널 변수 선언 시 초기값을 지정하지 않으면 자동으로 nil이 할당됩니다.

var surveyAnswer: String?

/*
 Swift의 nil과 Objective-C의 nil은 동일하지 않습니다. Objective-C의 nil은 존재하지 않는 객체에 대한 포인터이며,
 Swift의 경우 포인터가 아닌 값이 없음을 나타내는 키워드입니다. 따라서 어떠한 타입이든 옵셔널 타입으로 선언할 수 있습니다.
 */

// If Statements and Forced Unwrapping

// If문을 사용해서 옵셔널 변수에 값이 존재하는지 확인할 수 있습니다.
// 옵셔널 변수가 nil이 아니면 옵셔널 변수 끝에 '!' 특수문자를 사용하여 옵셔널 변수의 값을 추출할 수 있습니다.
// '!' 특수문자를 사용하여 옵셔널 변수값을 추출하는 것을 옵셔널 강제 언래핑이라고 합니다.

if convertedNumber != nil {
    print("convvertedNumber contains some integer value. \(convertedNumber!)")
}

/*
 옵셔널 변수의 값이 nil일 경우 강제 언래핑을 시도하면 런타임 에러가 발생합니다.
 항상 옵셔널 변수에 값이 존재하는지 검증을 하고 강제 언래핑을 해야 합니다.
 */
