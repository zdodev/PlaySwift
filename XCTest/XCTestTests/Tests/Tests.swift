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
    
    // MARK: - Comparable Value Assertions
    
    func test_XCTAssertGreaterThan() {
        let result = sut.returnOne()
        let expectedValue = 0
        XCTAssertGreaterThan(result, expectedValue)
    }
    
    func test_XCTAssertGreaterThanOrEqual() {
        let result = sut.returnOne()
        var expectedValue = 0
        XCTAssertGreaterThanOrEqual(result, expectedValue)
        
        expectedValue = 1
        XCTAssertGreaterThanOrEqual(result, expectedValue)
    }
    
    func test_XCTAssertLessThanOrEqual() {
        let result = sut.returnOne()
        var expectedValue = 1
        XCTAssertLessThanOrEqual(result, expectedValue)
        
        expectedValue = 2
        XCTAssertLessThanOrEqual(result, expectedValue)
    }
    
    func test_XCTAssertLessThan() {
        let result = sut.returnOne()
        let expectedValue = 2
        XCTAssertLessThan(result, expectedValue)
    }
    
    // MARK: - Error Assertions
    
    func test_XCTAssertThrowsError() {
        XCTAssertThrowsError(try sut.throwError(1))
    }
    
    func test_XCTAssertNoThrow() {
        XCTAssertNoThrow(try sut.throwError(0))
    }
    
    // MARK: - Unconditional Test Failures
    
    func test_XCTFail() {
//        XCTFail()
    }
    
    // MARK: - Expected Failures
    
    func test_XCTExpectFailure() {
        let result = sut.returnFalse()
        XCTExpectFailure()
        XCTAssertTrue(result)
    }
    
    func test_XCTExpectFailureBlock() {
        let result = sut.returnFalse()
        XCTExpectFailure {
            XCTAssertTrue(result)
        }
    }
}



