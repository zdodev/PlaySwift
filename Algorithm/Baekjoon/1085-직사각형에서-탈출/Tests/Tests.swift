import XCTest

class Tests: XCTestCase {
    let sut = Solution()
    
    func test_윗변이_가장_가까워야_한다() {
        let result = sut.shortestDistance([6, 2, 10, 3])
        let expectedValue = 1
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_아랫변이_가장_가까워야_한다() {
        let result = sut.shortestDistance([7, 1, 10, 3])
        let expectedValue = 1
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_오른쪽변이_가장_가까워야_한다() {
        let result = sut.shortestDistance([9, 2, 10, 4])
        let expectedValue = 1
        XCTAssertEqual(result, expectedValue)
    }
}
