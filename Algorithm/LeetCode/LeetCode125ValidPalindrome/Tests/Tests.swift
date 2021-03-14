//
//  Tests.swift
//  Tests
//
//  Created by Zero DotOne on 2021/01/11.
//

import XCTest

class Tests: XCTestCase {
    var solution: Solving!

    override func setUpWithError() throws {
        try super.setUpWithError()
        solution = Solution2()
    }

    override func tearDownWithError() throws {
        solution = nil
        try super.tearDownWithError()
    }

    func testZeroInput() throws {
        let input = ""
        let output = true
        XCTAssertEqual(solution.isPalindrome(input), output)
    }
    
    func testOneCharacterString() throws {
        let input = "a"
        let output = true
        XCTAssertEqual(solution.isPalindrome(input), output)
    }
    
    func testTwoCharacterPalindrome() throws {
        let input = "aa"
        let output = true
        XCTAssertEqual(solution.isPalindrome(input), output)
    }
    
    func testTwoCharacterNonePalindrome() throws {
        let input = "ab"
        let output = false
        XCTAssertEqual(solution.isPalindrome(input), output)
    }
}
