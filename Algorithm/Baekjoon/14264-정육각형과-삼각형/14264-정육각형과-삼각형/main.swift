import Foundation

struct Solution {
    private func readInteger() -> Double {
        Double(readLine()!)!
    }
    
    func solution() {
        let l = readInteger()
        let result = sqrt(3) / 4.0 * pow(l, 2)
        print(String(format: "%.9f", result))
    }
}

Solution().solution()
