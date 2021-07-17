import XCTest

final class Tests: XCTestCase {
    let solution = Solution()
    
    func test_같은_눈3() {
        let value = solution.rolling([5, 5, 5])
        let expectedValue = 10_000 + 5 * 1_000
        XCTAssertEqual(value, expectedValue)
    }
    
    func test_같은_눈2() {
        let value = solution.rolling([4, 5, 5])
        let expectedValue = 1_000 + 5 * 100
        XCTAssertEqual(value, expectedValue)
    }
    
    func test_같은_눈1() {
        let value = solution.rolling([4, 5, 6])
        let expectedValue = 6 * 100
        XCTAssertEqual(value, expectedValue)
    }
}
