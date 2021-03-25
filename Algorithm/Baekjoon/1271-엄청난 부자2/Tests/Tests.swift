import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func testQuotient() {
        _ = testCase.testCase.map { (input, output) in
            let result = solution.solution(input.0, input.1)
            XCTAssertEqual(output.0, result.0)
            XCTAssertEqual(output.1, result.1)
        }
    }
}

