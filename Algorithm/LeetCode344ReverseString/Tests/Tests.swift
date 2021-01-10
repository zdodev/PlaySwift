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
        var input: [Character] = []
        let output: [Character] = []
        solution.reverseString(&input)
        XCTAssertEqual(input, output)
    }
    
    func testOneInput() throws {
        var input: [Character] = ["a"]
        let output: [Character] = ["a"]
        solution.reverseString(&input)
        XCTAssertEqual(input, output)
    }

    func testTwoInput() throws {
        var input: [Character] = ["1", "2"]
        let output: [Character] = ["2", "1"]
        solution.reverseString(&input)
        XCTAssertEqual(input, output)
    }

    func testThreeInput() throws {
        var input: [Character] = ["s", "w", "i"]
        let output: [Character] = ["i", "w", "s"]
        solution.reverseString(&input)
        XCTAssertEqual(input, output)
    }
}
