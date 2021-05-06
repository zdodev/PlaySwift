import XCTest

class Tests: XCTestCase {
    var solution = Solution()
    let testCase = TestCase()
    
    func test_permutations() {
        for index in 0..<testCase.input.count {
            let result = solution.permute(testCase.input[index])
            let expectedValue = testCase.output[index]
            XCTAssertEqual(result, expectedValue)
        }
    }
}
