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
    
    // MARK: - Equality and Inequality Assertions
    
    func test_XCTAssertEqual() {
        let result = sut.returnOne()
        let expectedValue = 1
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_XCTAssertNotEqual() {
        let result = sut.returnOne()
        let notExpectedValue = 2
        XCTAssertNotEqual(result, notExpectedValue)
    }
}
