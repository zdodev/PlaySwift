import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    var testCase = TestCase()
    
    func test_reverseString() {
        for index in 0..<testCase.all.count {
            solution.reverseString(&testCase.all[index])
            let expectedValue = testCase.result[index]
            XCTAssertEqual(expectedValue, testCase.all[index])
        }
    }
}
