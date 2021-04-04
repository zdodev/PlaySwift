import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let testCase = TestCase()
    
    func test_잘못_입력된_파티_참가_인원수() {
        for index in 0..<testCase.all.count {
            let result = solution.result(testCase.all[index][0], area: testCase.all[index][1], errors: testCase.error[index]
            )
            let expectedValue = testCase.result[index]
            XCTAssertEqual(result, expectedValue, "fail")
        }
    }
}
