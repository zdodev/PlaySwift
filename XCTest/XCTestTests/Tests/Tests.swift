import XCTest

class Tests: XCTestCase {
    let sut = TestObject()
    let sutClass = TestClass()
    
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
    
    func test_XCTAssertIdentical() {
        let result = sutClass
        let expectedValue = sutClass
        XCTAssertIdentical(result, expectedValue)
    }
    
    func test_XCTAssertNotIdentical() {
        let result = sutClass
        let expectedValue = TestClass()
        XCTAssertNotIdentical(result, expectedValue)
    }
    
    func test_XCTAssertEqualFloatingPoint() {
        let result = sut.returnOnePointOneTwoThreeFour()
        let expectedValue = 1.1233
        // accuracy는 +/- 정확도를 의미한다.
        XCTAssertEqual(result, expectedValue, accuracy: 0.0001)
    }
    
    func test_XCTAssertEqualNumeric() {
        let result = sut.returnOne()
        let expectedValue = 2
        XCTAssertEqual(result, expectedValue, accuracy: 1)
    }
    
    func test_XCTAssertEqualNotEqualFloatingPoint() {
        let result = sut.returnOnePointOneTwoThreeFour()
        let expectedValue = 1.1
        // accuracy는 +/- 정확도를 의미한다.
        XCTAssertNotEqual(result, expectedValue, accuracy: 0)
    }
    
    func test_XCTAssertNotEqualNumeric() {
        let result = sut.returnOne()
        let expectedValue = 2
        XCTAssertNotEqual(result, expectedValue, accuracy: 0)
    }
}
