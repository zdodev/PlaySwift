import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_고유번호의_제곱() {
        let result = solution.square(testCase.all[0][1])
        let expectedValue = 16
        XCTAssertEqual(result, expectedValue, "fail.")
    }
    
    func test_고유번호_제곱의_합() {
        let result = solution.sumOfSquares(testCase.all[0])
        let expectedValue = 81
        XCTAssertEqual(result, expectedValue, "fail.")
    }
    
    func test_검증수() {
        for index in 0..<testCase.all.count {
            let squares = solution.result(testCase.all[index])
            let result = solution.identifierNumber(squares)
            let expectedValue = testCase.result[index]
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
}
