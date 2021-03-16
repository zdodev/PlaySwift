import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let model = Model()
    
    func testMethod1() {
        let value = solution.trap(model.input[0])
        let expectedValue = model.output[0]
        XCTAssertEqual(value, expectedValue, "method 1 실패.")
    }
    
    func testMethod2() {
        let value = solution.trap(model.input[1])
        let expectedValue = model.output[1]
        XCTAssertEqual(value, expectedValue, "method 2 실패.")
    }
    
    func testMethod3() {
        let value = solution.trap(model.input[2])
        let expectedValue = model.output[2]
        XCTAssertEqual(value, expectedValue, "method 3 실패.")
    }
}

struct Model {
    let input = [
        [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1],
        [4, 2, 0, 3, 2, 5],
        [0, 1, 2, 3, 2, 1, 0]
    ]
    let output = [
        6,
        9,
        0
    ]
}
