import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        lhs + rhs
    }
    
    func result(_ numbers: [Int]) -> Int {
        add(numbers[0], numbers[1])
    }
    
    func solution() {
        let firstNumber = readInteger()
        let secondNumber = readInteger()
        let sum = result([firstNumber, secondNumber])
        print(sum)
    }
}

Solution().solution()

struct TestCase {
    let all = [
        [1, 2],
        [9999, -9999]
    ]
    let result = [
        3,
        0
    ]
}
