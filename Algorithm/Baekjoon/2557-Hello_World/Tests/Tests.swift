import XCTest

class Tests: XCTestCase {
    var solution = Solution()
    
    func testExample() throws {
        let result = solution.makeString()
        let expectedText = "Hello World!"
        XCTAssertEqual(result, expectedText, "테스트 실패")
    }

    func testPerformanceExample() throws {
        measure {
            solution.result()
        }
    }
}
