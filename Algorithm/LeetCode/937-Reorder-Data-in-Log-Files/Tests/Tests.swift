import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_reorderLogFiles() {
        for index in 0..<testCase.input.count {
            let result = solution.reorderLogFiles(testCase.input[index])
            let expectedValue = testCase.output[index]
            XCTAssertEqual(result, expectedValue)
        }
    }
}
