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

func overflowOperators() {
    var potentialOverflow = Int16.max
//    potentialOverflow += 1
}

/// Value Overflow

func valueOverflow() {
    var unsignedOverflow = UInt8.max
    unsignedOverflow = unsignedOverflow &+ 1
    print(unsignedOverflow)
    
    unsignedOverflow = UInt8.min
    unsignedOverflow = unsignedOverflow &- 1
    print(unsignedOverflow)
    
    var signedOverflow = Int8.min
    signedOverflow &-= 1
    print(signedOverflow)
}

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

/// Precedence for Custom Infix Operators
