import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testcase = TestCase()
    
    func test_num_of_islands() {
        for index in 0..<testcase.testCase.count {
            let result = solution.numIslands(testcase.testCase[index])
            let expectedValue = testcase.output[index]
            XCTAssertEqual(result, expectedValue)
        }
    }
}
