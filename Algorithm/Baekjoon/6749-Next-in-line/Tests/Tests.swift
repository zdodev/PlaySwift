import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()

    func test_둘째와_셋째의_나이차이는_3이다() {
        let result = solution.subtract(testCase.all[0][0], testCase.all[0][1])
        let expectedValue = 3
        XCTAssertEqual(result, expectedValue, "fail")
    }
    
    func test_TestCase() {
        for index in 0..<testCase.all.count {
            let result = solution.result(testCase.all[index])
            let expectedValue = testCase.result[index]
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
}
