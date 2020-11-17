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

/// Shifting Behavior for Signed Integers

/// Overflow Operators

/// Value Overflow

/// Precedence and Associativity

/// Operator Methods

/// Prefix and Postfix Operators

/// Compound Assignment Operators

/// Equivalence Operators

/// Custom Operators

/// Precedence for Custom Infix Operators
