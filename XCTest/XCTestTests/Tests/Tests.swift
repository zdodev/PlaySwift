import XCTest

class Tests: XCTestCase {
    let sut = TestObject()
    
    // MARK: - Boolean Assertions
    func test_XCTAssert() {
        XCTAssert(sut.returnTrue())
    }
    
    func test_XCTAssertTrue() {
        XCTAssertTrue(sut.returnTrue())
    }
    
    func test_XCTAssertFalse() {
        XCTAssertFalse(sut.returnFalse())
    }
    
    // MARK: - Nil and Non-Nil Assertions
    func test_XCTAssertNil() {
        XCTAssertNil(sut.returnNil())
    }
    
    func test_XCTAssertNotNil() {
        XCTAssertNotNil(sut.returnNotNil())
    }
    
    func test_XCTUnwrap() {
        let value = try? XCTUnwrap(sut.returnNotNil())
        XCTAssertEqual(value, 0)
    }
}
