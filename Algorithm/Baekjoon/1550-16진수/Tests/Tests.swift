import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func testHexStringToDecimal() throws {
        let result = solution.hexStringToDecimal(testCase.testCase[0].0)
        let expectedValue = testCase.testCase[0].1
        XCTAssertEqual(result, expectedValue, "16진수 변환 실패.")
    }
    
    func testTestCase() throws {
        _ = testCase.testCase.map { (input, output) in
            let result = solution.hexStringToDecimal(input)
            XCTAssertEqual(result, output, "16진수 변환 실패")
        }
    }
}
