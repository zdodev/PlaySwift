import XCTest

class Tests: XCTestCase {
    let sut = Solution()
    
    func test_앞자리_수가_555다() {
        let result1 = sut.checkNumber(555_1212)
        XCTAssertTrue(result1)
        
        let result2 = sut.checkNumber(556_1212)
        XCTAssertFalse(result2)
    }
}
