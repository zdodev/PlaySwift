import XCTest

class Tests: XCTestCase {
    let multiplication = Multiplication()
    let number = 468
    let isolatedDigits = [400, 60, 8]
    
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
        let value = multiplication.isolateUnitDigit(number)
        let expectedValue = isolatedDigits[2]
        XCTAssertEqual(value, expectedValue, "isolateUnitDigit 실패")
    }
    
    func testIsolateTensDigit() {
        let value = multiplication.isolateTensDigit(number)
        let expectedValue = isolatedDigits[1]
        XCTAssertEqual(value, expectedValue, "isolateTensDigit 실패")
    }
    
    func testIsolateHundredsDigit() {
        let value = multiplication.isolateHundredsDigit(number)
        let expectedValue = isolatedDigits[0]
        XCTAssertEqual(value, expectedValue, "isolateHundredsDigit 실패")
    }
    
//    func testMakeUnitDigitMultiplicationResult() {
//        let value = multiplication.makeUnitDigitMultiplicationResult(number)
//        let expectedValue = isolatedDigits[2]
//        XCTAssertEqual(value, expectedValue, "unit digit 연산 실패")
//    }
}
