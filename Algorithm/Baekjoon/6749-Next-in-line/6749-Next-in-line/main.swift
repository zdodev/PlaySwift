import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        rhs - lhs
    }
    
    func calculateOlderBrotherAge(_ ages: [Int]) -> Int {
        ages[1] + subtract(ages[0], ages[1])
    }
    
    func result(_ ages: [Int]) -> Int {
        calculateOlderBrotherAge(ages)
    }
    
    func solution() {
        var input = [Int]()
        for _ in 0..<2 {
            input.append(readInteger())
        }
        let olderBrotherAge = calculateOlderBrotherAge(input)
        print(olderBrotherAge)
    }
}

Solution().solution()

struct TestCase {
    let all = [
        [12, 15],
        [10, 15],
    ]
    let result = [
        18,
        20
    ]
}

