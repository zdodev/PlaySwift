//
//  SetUpAndTearDownExampleTests.swift
//  SetUpAndTearDownExampleTests
//
//  Created by zdo on 2020/12/16.
//

import XCTest
@testable import SetUpAndTearDownExample

class SetUpAndTearDownExampleTests: XCTestCase {
    override class func setUp() {
        // This is the setUp() class method.
        // It is called before the first test method begins.
        // Set up any overall initial state here.
        super.setUp()
        print("*** called: override class func setUp()")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // This is the setUpWithError() instance method.
        // It is called before each test method begins.
        // Set up any per-test state here.
        try super.setUpWithError()
        print("*** called: override func setUpWithError()")
    }
    
    override func setUp() {
        // This is the setUp() instance method.
        // It is called before each test method begins.
        // Use setUpWithError() to setu up any per-test state,
        // unless you have legacy tests using setUp().
        super.setUp()
        print("*** called: overried func setUp()")
    }
    
    func testMethod1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // This is the first test method.
        // Your testing code goes here.
        
        print("*** called: func testMethod1()")
        
        addTeardownBlock {
            // Called when testMethods1() end.
            print("*** called: addTeardownBlock in testMethod1")
        }
        
        print("*** called: func testMethod1() after")
    }
    
    func testMethod2() throws {
        // This is the second test method.
        // Your testing code goes here.
        
        print("*** called: func testMethod2()")
        
        addTeardownBlock {
            // Called when testMethod2() ends.
            
            print("*** called: addTeardownBlock1 in testMethod2")
        }
        
        addTeardownBlock {
            // Called when testMethod2() ends.
            
            print("*** called: addTeardownBlock2 in testMethod2")
        }
    }
    
    override func tearDown() {
        // This is the tearDown() instance method.
        // It is called after each test method completes.
        // Use tearDownWithError() for any per-test cleanup,
        // unless you have legacy tests using tearDown().
        print("*** called: overried func tearDown()")
        super.tearDown()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // This is the tearDownWithError() instance method.
        // Is it called after each test method completes.
        // Perforn any per-test cleanup here.
        print("*** called: override func tearDownWithError()")
        try super.tearDownWithError()
    }
    
    override class func tearDown() {
        // This is the tearDown() class method.
        // It is called after all test methods complete.
        // Perform any overall cleanup here.
        print("*** called: override class func tearDown()")
        super.tearDown()
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
