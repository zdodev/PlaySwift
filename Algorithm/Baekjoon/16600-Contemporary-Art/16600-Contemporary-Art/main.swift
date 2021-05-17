import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let squareRoot = sqrt(Double(input))
        print(squareRoot * 4)
    }
}

Solution().solution()
