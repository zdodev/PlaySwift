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

valueOverflow()

/// Precedence and Associativity

func precedenceAndAssociativity() {
    print(2 + 3 % 4 * 5)
}

/// Operator Methods

/// Prefix and Postfix Operators

/// Compound Assignment Operators

/// Equivalence Operators

/// Custom Operators

/// Precedence for Custom Infix Operators
