import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let model = Model()
    
    func testUnitDigitTen0() {
        let result = solution.solution(model.input[0])
        let expectedValue = model.output[0]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
    
    func testUnitDigitTen1() {
        let result = solution.solution(model.input[1])
        let expectedValue = model.output[1]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
    
    func testUnitDigitTen2() {
        let result = solution.solution(model.input[2])
        let expectedValue = model.output[2]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
    
    func testUnitDigitTen3() {
        let result = solution.solution(model.input[3])
        let expectedValue = model.output[3]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
    
    func testUnitDigitOne0() {
        let result = solution.solution(model.input[4])
        let expectedValue = model.output[4]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }

    func testUnitDigitOne1() {
        let result = solution.solution(model.input[5])
        let expectedValue = model.output[5]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
    
    func testUnitDigitOne2() {
        let result = solution.solution(model.input[6])
        let expectedValue = model.output[6]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }

    func testUnitDigitOne3() {
        let result = solution.solution(model.input[7])
        let expectedValue = model.output[7]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }

    func testUnitDigitTwo0() {
        let result = solution.solution(model.input[8])
        let expectedValue = model.output[8]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }

    func testUnitDigitTwo1() {
        let result = solution.solution(model.input[9])
        let expectedValue = model.output[9]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }

    func testUnitDigitTwo2() {
        let result = solution.solution(model.input[10])
        let expectedValue = model.output[10]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
    
    func testUnitDigitTwo3() {
        let result = solution.solution(model.input[11])
        let expectedValue = model.output[11]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
    
    func testUnitDigitNine1() {
        let result = solution.solution(model.input[12])
        let expectedValue = model.output[12]
        XCTAssertEqual(result, expectedValue, "method1 실패.")
    }
}

struct Model {
    let input = [
        [10, 1],
        [10, 10],
        [10, 100],
        [10, 1000],
        [1, 1],
        [1, 10],
        [1, 100],
        [1, 1000],
        [2, 1],
        [2, 10],
        [2, 100],
        [2, 1000],
        [9, 635]
    ]
    
    let output = [
        10,
        10,
        10,
        10,
        1,
        1,
        1,
        1,
        2,
        4,
        6,
        6,
        9
    ]
}
