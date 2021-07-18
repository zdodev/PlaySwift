import XCTest

final class Tests: XCTestCase {
    let solution = Solution()
    
    func test_도() {
        let result = solution.rolling([0, 1, 1, 1])
        let expectedValue = "A"
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_개() {
        let result = solution.rolling([0, 1, 1, 0])
        let expectedValue = "B"
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_걸() {
        let result = solution.rolling([0, 1, 0, 0])
        let expectedValue = "C"
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_윷() {
        let result = solution.rolling([0, 0, 0, 0])
        let expectedValue = "D"
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_모() {
        let result = solution.rolling([1, 1, 1, 1])
        let expectedValue = "E"
        XCTAssertEqual(result, expectedValue)
    }
}
