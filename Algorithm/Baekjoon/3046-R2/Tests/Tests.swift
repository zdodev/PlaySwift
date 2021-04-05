import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_R2_formula() {
        for index in 0..<testCase.all.count {
            let result = solution.result(testCase.all[index])
            let expectedValue = testCase.result[index]
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
}
