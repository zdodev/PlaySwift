import XCTest

class Tests: XCTestCase {
    let calculator = Calculator()
    func testAddition() {
        let value = calculator.add(4, 2)
        let expectedValue = 6
        XCTAssertEqual(value, expectedValue, "addition 실패.")
    }
    
    func testSubtraction() {
        let value = calculator.subtract(5, 2)
        let expectedValue = 3
        XCTAssertEqual(value, expectedValue, "subtraction 실패.")
    }
    
    func testMultiplication() {
        let value = calculator.multiply(5, 3)
        let expectedValue = 15
        XCTAssertEqual(value, expectedValue, "multiplication 실패.")
    }
    
    func testDivision() {
        let value = calculator.divide(5, 3)
        let expectedValue = 1
        XCTAssertEqual(value, expectedValue, "division 실패.")
    }
}
