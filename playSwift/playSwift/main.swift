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

// Type Annotations

// 상수 또는 변수를 선언할 때 타입을 명시하여 선언할 수 있습니다.

var welcomeMessage: String
welcomeMessage = "Hello"

// 콤마(,)를 사용하여 한 줄에 같은 타입의 변수를 선언할 수 있습니다.

var red, green, blue: Double

/*
 실제로 type annotations를 사용하지 않더라도 Swift의 타입 추론을 통해 변수 선언 시 초기 값을 제공하면
 Swift에서 타입을 추론하여 지정합니다.
 */


