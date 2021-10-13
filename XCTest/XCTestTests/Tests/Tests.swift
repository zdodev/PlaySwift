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
    
    // MARK: - Methods for Skipping Tests
    
    func test_XCTSkip() throws {
        throw XCTSkip("Test skip.")
        
        let value = sut.returnOne()
        let expectedValue = 0
        XCTAssertEqual(value, expectedValue)
    }
    
    func test_XCTSkipIf() throws {
        try XCTSkipIf(true, "Test skip.")
        
        let value = sut.returnOne()
        let expectedValue = 0
        XCTAssertEqual(value, expectedValue)
    }
    
    func test_XCTSkipUnless() throws {
        try XCTSkipUnless(false, "Test skip.")
        
        let value = sut.returnOne()
        let expectedValue = 0
        XCTAssertEqual(value, expectedValue)
    }
    
    // MARK: - Asynchronous Tests and Expectations
    
    func test_XCTestExpectation() {
        // XCTestExpectation 생성
        let expectation = XCTestExpectation(description: "Download apple.com home page")
        
        let url = URL(string: "https://apple.com")!
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            // 데이터 수신 테스트
            XCTAssertNotNil(data)
            // expectation fulfill 실행
            expectation.fulfill()
        }
        
        dataTask.resume()
        // expectation fulfill 실행까지 10.0초 대기
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_XCTKVOExpectation() {
        let sut = KVOClass()
        let expectation = XCTKVOExpectation(keyPath: "value", object: sut, expectedValue: "white")
        sut.value = "white"
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_XCTNSNotificationExpectation() {
        let expectation = XCTNSNotificationExpectation(name: .init("notification"))
        NotificationCenter.default.post(name: .init("notification"), object: nil)
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_XCTNSPredicateExpectation() {
        let publisher = ArticlePublisher()
        var article = Article(isPublished: false)
        
        let predicate = NSPredicate(format: "%K == YES", #keyPath(Article.isPublished))
        let publishExpectation = XCTNSPredicateExpectation(predicate: predicate, object: article)
        publisher.publish(&article)
        wait(for: [publishExpectation], timeout: 10.0)
    }
}
