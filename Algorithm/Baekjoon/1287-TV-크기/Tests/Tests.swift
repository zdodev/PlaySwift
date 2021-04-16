import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_x구하는_공식() {
        let result = solution.calculateX([5, 2, 4])
        let expectedValue = sqrt(1.25)
        XCTAssertEqual(result, expectedValue, "fail")
    }
}
