import XCTest

class Tests: XCTestCase {
    let testCase = TestCase()
    let solution = Solution()
    
    func test_점수총합_구하기() {
        let input1 = testCase.input[0][0]
        let input2 = testCase.input[0][1]
        let output = solution.total(input1, input2)
        XCTAssertEqual([4, 2], output)
    }
    
    func test_총점이_같은_지() {
        let input1 = testCase.input[2][0]
        let input2 = testCase.input[2][1]
        let output1 = solution.total(input1, input2)
        let output2 = solution.isSameScore(output1)
        XCTAssertTrue(output2)
        
        let input3 = testCase.input[1][0]
        let input4 = testCase.input[1][1]
        let output5 = solution.total(input3, input4)
        let output6 = solution.isSameScore(output5)
        XCTAssertFalse(output6)
    }
    
    // 테스트가 결과를 비교하지 말고 구현체가 결과를 비교하고 반환하도록 하자.
    func test_총점이_페르세폴리가_높을_때_직접테스트에서_비교() {
        let input1 = testCase.input[0][0]
        let input2 = testCase.input[0][1]
        let output = solution.total(input1, input2)
        // 테스트가 직접 비교하는 구문
        XCTAssertTrue(output[0] > output[1])
    }
    
    // 테스트가 결과를 비교하지 않고 구현체에게 요구하니 일반화가 가능해졌다.
    func test_총점이_페르세폴리가_높을_때() {
        let input1 = testCase.input[0][0]
        let input2 = testCase.input[0][1]
        let output = solution.total(input1, input2)
        XCTAssertEqual("Persepolis", solution.whoWin(output))
    }
    
    func test_총점이_에스테그랄이_높을_때() {
        let input1 = testCase.input[1][0]
        let input2 = testCase.input[1][1]
        let output = solution.total(input1, input2)
        XCTAssertEqual("Esteghlal", solution.whoWin(output))
    }
    
    func test_총점이_같고_페르세폴리가_원정골이_높을_때() {
        let input1 = testCase.input[3][0]
        let input2 = testCase.input[3][1]
        let total = solution.total(input1, input2)
        let gameResult = solution.isSameScore(total)
        XCTAssertTrue(gameResult)
        let winner = solution.whoHigherAwayScore(input1, input2)
        XCTAssertEqual("Persepolis", winner)
    }
    
    func test_총점이_같고_에스테그랄이_원정골이_높을_때() {
        let input1 = testCase.input[4][0]
        let input2 = testCase.input[4][1]
        let total = solution.total(input1, input2)
        let gameResult = solution.isSameScore(total)
        XCTAssertTrue(gameResult)
        let winner = solution.whoHigherAwayScore(input1, input2)
        XCTAssertEqual("Esteghlal", winner)
    }
    
    func test_총점이_같고_원정골도_같을_때() {
        let input1 = testCase.input[5][0]
        let input2 = testCase.input[5][1]
        let total = solution.total(input1, input2)
        let gameResult = solution.isSameScore(total)
        XCTAssertTrue(gameResult)
        let awayGameResult = solution.isSameAwayScore(input1, input2)
        XCTAssertTrue(awayGameResult)
    }
    
    func test_총점이_같고_원정골이_다를_때() {
        let input1 = testCase.input[3][0]
        let input2 = testCase.input[3][1]
        let total = solution.total(input1, input2)
        let gameResult = solution.isSameScore(total)
        XCTAssertTrue(gameResult)
        let awayGameResult = solution.isSameAwayScore(input1, input2)
        XCTAssertFalse(awayGameResult)
    }
    
    func test_결과() {
        let input1 = testCase.input[5][0]
        let input2 = testCase.input[5][1]
        let result = solution.solution(input1, input2)
        XCTAssertEqual("Penalty", result)
    }
    
    func test_결과_1() {
        let input1 = testCase.input[4][0]
        let input2 = testCase.input[4][1]
        let result = solution.solution(input1, input2)
        XCTAssertEqual("Esteghlal", result)
    }
    
    func test_결과_2() {
        let input1 = testCase.input[3][0]
        let input2 = testCase.input[3][1]
        let result = solution.solution(input1, input2)
        XCTAssertEqual("Persepolis", result)
    }
}
