import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_letter_combinations_of_a_phone_number() {
        for index in 0..<testCase.testCase.count {
            let result = solution.solution(testCase.testCase[index])
            let expectedValue = testCase.output[index]
            XCTAssertEqual(result, expectedValue)
        }
    }
}
