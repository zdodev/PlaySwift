import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_sum_of_all_seats() {
        for index in 0..<testCase.all.count {
            let result = solution.result(testCase.all[index])
            let expectedValue = testCase.result[index]
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
}
