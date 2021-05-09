import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_isPalindrome() {
        for index in 0..<testCase.input.count {
            let result = solution.isPalindrome(testCase.input[index])
            let expectedValue = testCase.output[index]
            XCTAssertEqual(result, expectedValue)
        }
    }
}
