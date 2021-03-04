import XCTest

class Tests: XCTestCase {
    var solution = Solution()
    
    func testExample() throws {
        let result = solution.text
        let expectedText = "Hello, world"
        XCTAssertEqual(result, 0, "테스트 통과")
    }

    func testPerformanceExample() throws {
        measure {
//            solution.result()
        }
    }
}
