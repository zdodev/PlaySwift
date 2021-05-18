import XCTest

class Tests: XCTestCase {
    let testCase = TestCase()
    let solution = Solution()
    
    func test_테스트케이스_입력() {
        let input1 = testCase.input[0][0]
        let input2 = testCase.input[0][1]
        XCTAssertEqual([8, 4], input1)
        XCTAssertEqual([7, 9], input2)
    }
    
    func test_면적() {
        let area = solution.area(testCase.input[0][1])
        XCTAssertEqual(7 * 7 * Double.pi, area)
    }
}
