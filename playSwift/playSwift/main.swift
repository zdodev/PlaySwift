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
