import Foundation

struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let input = readInteger()
        let result = sqrt(Double(input)) * 4
        print(result)
    }
}

Solution().solution()
