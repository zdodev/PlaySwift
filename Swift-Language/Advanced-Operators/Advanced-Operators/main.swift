/// Advanced Operators

/// Bitwise Operators

/// Bitwise NOT Operator

func bitwiseNotOperator() {
    let initialBits: UInt8 = 0b00001111
    let invertedBits = ~initialBits
    print(invertedBits)
}

/// Bitwise AND Operator

func bitwiseAndOperator() {
    let firstSixBits: UInt8 = 0b11111100
    let lastSixBits: UInt8 = 0b00111111
    let middleFourBits = firstSixBits & lastSixBits
    print(middleFourBits)
}

/// Bitwise OR Operator

func bitwiseOrOperator() {
    let someBits: UInt8 = 0b10110010
    let moreBits: UInt8 = 0b01011110
    let combinedBits = someBits | moreBits
    print(combinedBits)
}

/// Bitwise XOR Operator

func bitwiseXorOperator() {
    let firstBits: UInt8 = 0b00010100
    let otherBits: UInt8 = 0b00000101
    let outputBits = firstBits ^ otherBits
    print(outputBits)
}

/// Bitwise Left and Right Shift Operators

/// Shifting Behavior for Unsigned Integers

func shiftingBehaviorForUnsignedIntegers() {
    let shiftBits: UInt8 = 0b100
    _ = shiftBits << 1
    _ = shiftBits << 2
    _ = shiftBits << 5
    _ = shiftBits << 6
    _ = shiftBits << 2

    let pink: UInt32 = 0xCC6699
    let redComponent = (pink & 0xFF0000) >> 16
    let greenComponent = (pink & 0x00FF00) >> 8
    let blueComponent = pink & 0x0000FF
}

/// Shifting Behavior for Signed Integers

/// Overflow Operators
/*
 어떤 수를 정수 상수나 변수에 할당할 때 그 값을 가지고 있을 수 없으면 Swift는 값을 생성하지 않고 에러를 출력합니다. Swift의 이러한 특성은 너무 크거나 작은 수를 다룰 때 안전성을 줍니다.
 */

var potentialOverflow = Int16.max
/*
 다음 구문으로 인해 오류가 발생합니다.
 Swift runtime failure: arithmetic overflow
 */
//potentialOverflow += 1

/*
 값이 너무 크거나 너무 작을 때 에러 처리를 제공하는 것은 경계 부근의 값을 가지고 코딩하는 조건에서 더 큰 유연함을 줍니다.

 하지만, 수치 값에서 유용한 비트만 잘라내고자 오버플로우 조건을 특별히 원할 때, 에러를 발생시키는 대신 이러한 동작 방식을 선택할 수도 있습니다. Swift는 정수 계산에 대한 오버플로우 동작을 선택하는 세 가지의 산술 오버플로우 연산자를 제공합니다. 이 연산자들은 모두 `&` 기호로 시작합니다.

 - Overflow addtion (&+)
 - Overflow subtraction (&-)
 - Overflow multiplication (&*)
 */

/// Value Overflow
/*
 수치 값은 양의 방향과 음의 방향 양쪽으로 다 오버플로우가 발생할 수 있습니다.
 */

print("Value Overflow")
var unsignedOverflow = UInt8.max
// 오버플로우 더하기 연산을 합니다.
unsignedOverflow = unsignedOverflow &+ 1
print(unsignedOverflow)

/*
 unsignedOverflow 변수는 UInt8 타입의 최대값으로 초기화됩니다. 그런 다음 오버플로우 더하기 연산으로 1만큼 증가합니다. 이는 UInt8 타입이 표현할 수 있는 범위를 벗어난 것으로, 오버플로우가 발생한 값은 버려집니다.
 */

unsignedOverflow = UInt8.min
// 오버플로우 빼기 연산을 합니다.
unsignedOverflow = unsignedOverflow &- 1
print(unsignedOverflow)

var signedOverflow = Int8.min
signedOverflow &-= 1
print(signedOverflow)

/// Precedence and Associativity

func precedenceAndAssociativity() {
    print(2 + 3 % 4 * 5)
}

/// Operator Methods

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

func operatorMethod() {
    let vector = Vector2D(x: 3.0, y: 1.0)
    let anotherVector = Vector2D(x: 2.0, y: 4.0)
    let combinedVector = vector + anotherVector
    print(combinedVector)
}

/// Prefix and Postfix Operators

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        Vector2D(x: -vector.x, y: -vector.y)
    }
}

func prefixAndPostfixOperators() {
    let positie = Vector2D(x: 3.0, y: 4.0)
    let negative = -positie
    let alsoPositive = -negative
    print(negative, alsoPositive)
}

/// Compound Assignment Operators

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

func compoundAssignmentOperators() {
    var original = Vector2D(x: 1.0, y: 2.0)
    let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
    original += vectorToAdd
    print(original)
}

/// Equivalence Operators

// 의문: Equtable 프로토콜 준수 시 '==' 연산자를 정의안해도 되는 이유는?
extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        left.x == right.x && left.y == right.y
    }
}

func equivalenceOperators() {
    let twoThree = Vector2D(x: 2.0, y: 3.0)
    let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)

    if twoThree == anotherTwoThree {
        print("These two vectors are equivalent.")
    }

    struct Vector3D: Equatable {
        var x = 0.0, y = 0.0, z = 0.0
    }

    let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
    let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)

    if twoThreeFour == anotherTwoThreeFour {
        print("These two vectors are aloas equivalent.")
    }
}

// 구현이 간단한 경우 스위프트가 통합된 '==' 연산에 대한 구현을 제공한다.

/// Custom Operators

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

func customOperators() {
    var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
    let afterDoubling = +++toBeDoubled
    print(afterDoubling)
}

/// Precedence for Custom Infix Operators

infix operator +-: AdditionPrecedence

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

func precedenceForCustomInfixOperators() {
    let firstVector = Vector2D(x: 1.0, y: 2.0)
    let secondVector = Vector2D(x: 3.0, y: 4.0)
    let plusMinusVector = firstVector +- secondVector
    print(plusMinusVector)
}
