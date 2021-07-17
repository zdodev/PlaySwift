import XCTest

final class Tests: XCTestCase {
    var solution = Solution()
    
    func test_첫_번째_역() {
        solution.station([0, 32])
        
        XCTAssertEqual(solution.currentPassenger, 32)
        
        solution.station([3, 13])
        
        XCTAssertEqual(solution.currentPassenger, 42)
        
        solution.station([28, 25])
        
        XCTAssertEqual(solution.currentPassenger, 39)
    }
}
