import XCTest

class Tests: XCTestCase {
    var solution = Solution()
    
    func testExample() throws {
        let result = solution.makeString()
        let expectedValue = "강한친구 대한육군"
        XCTAssertEqual(result, expectedValue, "테스트 실패")
    }

    func testPerformanceExample() throws {
        measure {
            solution.result1(repeatCount: 2)
        }
    }
}
