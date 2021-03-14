import XCTest

class Tests: XCTestCase {
    let solution = Solution()
    let model = Model()
    
    func testModel0() {
        let index = 0
        let result = solution.twoSum(model.nums[index], model.target[index])
        let expectedValue = model.expected[index]
        XCTAssertEqual(result, expectedValue, "model \(index) 실패.")
    }

    func testModel1() {
        let index = 1
        let result = solution.twoSum(model.nums[index], model.target[index])
        let expectedValue = model.expected[index]
        XCTAssertEqual(result, expectedValue, "model \(index) 실패.")
    }
    
    func testModel2() {
        let index = 2
        let result = solution.twoSum(model.nums[index], model.target[index])
        let expectedValue = model.expected[index]
        XCTAssertEqual(result, expectedValue, "model \(index) 실패.")
    }
}

struct Model {
    let nums = [
        [2, 7, 11, 15],
        [3, 2, 4],
        [3, 3]
    ]
    let target = [
        9,
        6,
        6
    ]
    let expected = [
        [0, 1],
        [1, 2],
        [0, 1]
    ]
}
