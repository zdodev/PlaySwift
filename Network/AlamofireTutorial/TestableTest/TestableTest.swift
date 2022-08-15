import XCTest

final class TestableTest: XCTestCase {
    let sut = API()
    
    func test_1곱하기1은_1() {
        let result = sut.multiply(1, 1)
        
        let expected = 1
        
        XCTAssertEqual(result, expected)
    }
    
    func test_1곱하기0은_0() {
        let result = sut.multiply(1, 0)
        
        let expected = 0
        
        XCTAssertEqual(result, expected)
    }
}
