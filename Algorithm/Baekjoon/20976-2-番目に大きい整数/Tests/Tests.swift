import XCTest

class Tests: XCTestCase {
    let sut = Solution()
    
    func test_주어진_배열을_오름차순으로_정렬한다() {
        let value = [3, 1, 2]
        
        let sortedValue = sut.sort(value)
        
        let expectedValue = [1, 2, 3]
        XCTAssertEqual(sortedValue, expectedValue)
    }
    
    func test_주어진_배열에서_두_번째로_큰_정수는_2다() {
        let value = [5, 2, 1]
        
        let sortedValue = sut.sort(value)
        
        let secondLargestInteger = sortedValue[1]
        let expectedValue = 2
        XCTAssertEqual(secondLargestInteger, expectedValue)
    }
}
