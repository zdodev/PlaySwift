import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_addition_withTwoInputs() {
        _ = testCase.all.map { (lhs, rhs, addition, x, y) in
            let result = solution.add(lhs, rhs)
            let expectedValue = addition
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
    
    func test_subtraction_withTwoInputs() {
        _ = testCase.all.map { (lhs, rhs, x, subtraction, y) in
            let result = solution.subtract(lhs, rhs)
            let expectedValue = subtraction
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
    
    func test_multiplication_withTwoInputs() {
        _ = testCase.all.map { (lhs, rhs, x, y, multiplication) in
            let result = solution.multiply(lhs, rhs)
            let expectedValue = multiplication
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
}
