import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_sum_of_array() {
        for index in 0..<testCase.input1.count {
            let result = solution.solution(testCase.input1[index], testCase.input2[index])
            let expectedValue = testCase.output[index]
            XCTAssertEqual(result, expectedValue)
        }
    }
}
