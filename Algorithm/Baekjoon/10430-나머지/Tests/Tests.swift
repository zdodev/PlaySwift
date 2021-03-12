import XCTest

class Tests: XCTestCase {
    let calculator = Calculator()
    
    func testAdd() {
        let result = calculator.add(3, 4)
        let expectedValue = 7
        XCTAssertEqual(result, expectedValue, "add method 실패.")
    }
    
    func testMultiply() {
        let result = calculator.multiply(2, 7)
        let expectedValue = 14
        XCTAssertEqual(result, expectedValue, "multiply method 실패.")
    }
    
    func testRemainder() {
        let result = calculator.remainder(5, 3)
        let expectedValue = 2
        XCTAssertEqual(result, expectedValue, "remainder method 실패.")
    }
    
    func testFirstExpression() {
        let result = calculator.performFirstExpression(5, 8, 4)
        let expectedValue = 1
        XCTAssertEqual(result, expectedValue, "performFirstExpression method 실패.")
    }
    
    func testSecondExpression() {
        let result = calculator.performSecondExpression(5, 8, 4)
        let expectedValue = 1
        XCTAssertEqual(result, expectedValue, "performSecondExpression method 실패.")
    }
    
    func testThirdExpression() {
        let result = calculator.performThirdExpression(5, 8, 4)
        let expectedValue = 0
        XCTAssertEqual(result, expectedValue, "performThirdExpression method 실패.")
    }
    
    func testFourthExpression() {
        let result = calculator.performFourthExpression(5, 8, 4)
        let expectedValue = 0
        XCTAssertEqual(result, expectedValue, "performFourthExpression method 실패.")
    }
}
