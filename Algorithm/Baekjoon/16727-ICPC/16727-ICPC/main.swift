struct Solution {
    private func readIntegers() -> [Int] {
        readLine()!.split(separator: " ").map {
            Int($0)!
        }
    }
    
    func total(_ first: [Int], _ second: [Int]) -> [Int] {
        [first[0] + second[1], first[1] + second[0]]
    }
    
    func whoWin(_ scores: [Int]) -> String {
        scores[0] > scores[1] ? "Persepolis" : "Esteghlal"
    }
    
    func isSameScore(_ scores: [Int]) -> Bool {
        scores[0] == scores[1]
    }
    
    func whoHigherAwayScore(_ first: [Int], _ second: [Int]) -> String {
        second[1] > first[1] ? "Persepolis" : "Esteghlal"
    }
    
    func isSameAwayScore(_ first: [Int], _ second: [Int]) -> Bool {
        first[1] == second[1]
    }
    
    func solution(_ input1: [Int], _ input2: [Int]) -> String {
        let totalScore = total(input1, input2)
        
        if isSameScore(totalScore) {
            if isSameAwayScore(input1, input2) {
                return "Penalty"
            } else {
                return whoHigherAwayScore(input1, input2)
            }
        } else {
            return whoWin(totalScore)
        }
    }
    
    func result() {
        let input1 = readIntegers()
        let input2 = readIntegers()
        print(solution(input1, input2))
    }
}

Solution().result()

struct TestCase {
    let input = [
        [[3, 0], [2, 1]],
        [[2, 5], [4, 1]],
        [[5, 5], [5, 5]],
        [[0, 2], [1, 3]],
        [[1, 3], [0, 2]],
        [[5, 5], [5, 5]],
    ]
}
