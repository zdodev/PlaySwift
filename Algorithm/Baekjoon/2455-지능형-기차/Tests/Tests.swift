import XCTest

final class Tests: XCTestCase {
    var solution = Solution()
    
    func test_첫_번째_역() {
        solution.station([0, 32])
        
        let expectedValue = 32
        
        XCTAssertEqual(solution.currentPassenger, expectedValue)
    }
    
    func test_두_번째_역() {
        solution.station([0, 32])
        solution.station([3, 13])
        
        let expectedValue = 42
        XCTAssertEqual(solution.currentPassenger, expectedValue)
    }
    
    func test_세_번째_역() {
        solution.station([0, 32])
        solution.station([3, 13])
        solution.station([28, 25])
        
        let expectedValue = 39
        XCTAssertEqual(solution.currentPassenger, expectedValue)
    }
    
    func test_네_번째_역() {
        solution.station([0, 32])
        solution.station([3, 13])
        solution.station([28, 25])
        solution.station([39, 0])
        
        let expectedValue = 0
        XCTAssertEqual(solution.currentPassenger, expectedValue)
    }
}
