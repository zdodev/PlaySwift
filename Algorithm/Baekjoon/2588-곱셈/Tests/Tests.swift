import XCTest

class Tests: XCTestCase {
    let multiplication = Multiplication()
    let firstNumber = 472
    let secondNumber = 385
    let isolatedDigits = [3, 8, 5]
    
    func testMultiply100() {
        let value = multiplication.multiply(100, 100)
        let expectedValue = 10000
        XCTAssertEqual(value, expectedValue, "multiply 실패")
    }
    
    func testMultiply999() {
        let value = multiplication.multiply(999, 999)
        let expectedValue = 998001
        XCTAssertEqual(value, expectedValue, "multiply 실패")
    }
    
    // 불필요할 수도?
//    func testIsolateDigit() {
//        let value = multiplication.isolateDigit(number)
//        let expectedValue = isolatedDigits
//        XCTAssertEqual(value, expectedValue, "isolateDigit 실패")
//    }
    
    func testIsolateUnitDigit() {
        let value = multiplication.isolateUnitDigit(secondNumber)
        let expectedValue = isolatedDigits[2]
        XCTAssertEqual(value, expectedValue, "isolateUnitDigit 실패")
    }
    
    func testIsolateTensDigit() {
        let value = multiplication.isolateTensDigit(secondNumber)
        let expectedValue = isolatedDigits[1]
        XCTAssertEqual(value, expectedValue, "isolateTensDigit 실패")
    }
    
    func testIsolateHundredsDigit() {
        let value = multiplication.isolateHundredsDigit(secondNumber)
        let expectedValue = isolatedDigits[0]
        XCTAssertEqual(value, expectedValue, "isolateHundredsDigit 실패")
    }
    
    func testMakeUnitDigitMultiplicationResult() {
        let value = multiplication.makeUnitDigitMultiplicationResult(firstNumber, secondNumber)
        let expectedValue = firstNumber * isolatedDigits[2]
        XCTAssertEqual(value, expectedValue, "unit digit 연산 실패")
    }
    
    func testMakeTensDigitMultiplicationResult() {
        let value = multiplication.makeTensDigitMultiplicationResult(firstNumber, secondNumber)
        let expectedValue = firstNumber * isolatedDigits[1]
        XCTAssertEqual(value, expectedValue, "tens digit 연산 실패")
    }
    
    func testMakeHundredsDigitMultiplicationResult() {
        let value = multiplication.makeHundredsDigitMultiplicationResult(firstNumber, secondNumber)
        let expectedValue = firstNumber * isolatedDigits[0]
        XCTAssertEqual(value, expectedValue, "hundreds digit 연산 실패")
    }
}
